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

    get "/health" do
      200
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
      results, total_results, duration = init_results

      unless q.empty?
        q.strip!

        results, total_results, duration = if use_real_results?
                                             get_real_results(q)
                                           else
                                             get_mock_results
                                           end
      end

      slim :search, layout: true, locals: {
        development: settings.development?,
        q: q,
        results: results,
        total_results: total_results,
        duration: duration,
      }
    end

    private

    def init_results
      results = []
      total_results = 0
      duration = 0.0

      [results, total_results, duration]
    end

    def use_real_results?
      return false if ENV["USE_MOCK_RESULTS"]

      settings.production? || settings.development?
    end

    def get_real_results(q)
      results = []
      duration = benchmark do
        results = settings.db.search(q, limit: PAGING_SIZE)
      end
      total_results = settings.db.last_result.count
      results.map! { |doc| SearchResult.new(doc, q) }

      [results, total_results, duration]
    end

    def get_mock_results
      results = Array.new(PAGING_SIZE) { MockSearchResult.new }
      total_results = PAGING_SIZE
      duration = [0.12, 0.25, 0.21, 0.19].sample

      [results, total_results, duration]
    end
  end
end
