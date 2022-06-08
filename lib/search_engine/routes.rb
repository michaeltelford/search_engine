# Place any routes/endpoints in this file.

module SearchEngine
  PAGING_SIZE = 10.freeze

  class App < Sinatra::Base
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

    get "/" do
      redirect to("/search")
    end

    get "/search" do
      q = params["q"] || ""
      results = []

      if not q.empty?
        q.strip!

        if use_real_results?
          results = settings.db.search(q, limit: PAGING_SIZE)
          results.map! { |doc| SearchResult.new(doc, q) }
        else
          results = Array.new(PAGING_SIZE) { MockSearchResult.new }
        end
      end

      slim :search, layout: true, locals: {
        development: settings.development?,
        q: q,
        results: results,
      }
    end
    
    private
    
    def use_real_results?
      return false if ENV["USE_MOCK_RESULTS"]
      
      settings.production? || settings.development?
    end
  end
end
