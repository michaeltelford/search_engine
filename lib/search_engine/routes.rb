module SearchEngine
  class App < Sinatra::Base
    # place any routes below...

    not_found do
      "Not found, sorry!"
    end

    error do
      "An error has occurred."
    end

    get "/assets/*" do
      env["PATH_INFO"].sub!("/assets", "")
      settings.sprockets.call(env)
    end

    get '/' do
      redirect to('/search')
    end

    get '/search' do
      q = params['q'] || ""
      results = []

      if not q.empty?
        q.strip!
        
        if settings.production?
          results = settings.db.search(q, false, 10)
          results.each { |doc| doc.search!(q) }
        else # use mock data for test and dev
          results = Array.new(10) { Document.new }
        end
      end

      slim :search, layout: true, locals: {
        development: settings.development?,
        q: q,
        results: results,
      }
    end
  end
end
