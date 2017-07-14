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
      slim :search, layout: true, locals: {
        :development => settings.development?
      }
    end

    get '/healthcheck' do
      200
    end
  end
end
