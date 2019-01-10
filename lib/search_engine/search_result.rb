module SearchEngine
  # Wrapper class for Wgit::Document's which gets passed to the templates.
  # Handles defaulting of missing values and keeps text formatting logic out of
  # the templates.
  class SearchResult
    NUM_KEYWORDS    = 5.freeze
    DEFAULT_TITLE   = "Untitled Webpage".freeze
    MAX_TEXT_LENGTH = 80.freeze

    # Params: doc is a Wgit::Document and q is a String.
    def initialize(doc, q)
      @doc = doc
      @q = q
      
      # Set @doc.text.first to be the highest ranking search result.
      @doc.search!(@q) # TODO: Pass in MAX_TEXT_LENGTH when wgit bug is fixed.
    end

    # Returns a String representing the webpage's title.
    def title
      @doc.title || DEFAULT_TITLE
    end

    # Returns a String of the webpage's keywords joined by a comma or nil if
    # @doc.keywords is nil.
    def keywords
      if @doc.keywords
        @doc.keywords[0..(NUM_KEYWORDS-1)].join(", ")
      else
        nil
      end
    end

    # Returns a String of the web page's highest ranking text snippet from the
    # query (@q).
    def text
      @doc.text.first
      # TODO: gsub @q for <b>@q</b>.
    end

    # Returns a String of the webpage's url.
    def url
      @doc.url
    end
  end
end
