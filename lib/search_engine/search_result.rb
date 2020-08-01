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
      @doc.search!(@q, sentence_limit: MAX_TEXT_LENGTH)
    end

    # Returns a String representing the webpage's title.
    def title
      @doc.title || DEFAULT_TITLE
    end

    # Returns a String of the webpage's keywords joined by a comma or nil if
    # @doc.keywords is nil.
    def keywords
      if @doc.keywords
        keywords = @doc.keywords[0..(NUM_KEYWORDS-1)].join(", ")
        embold(keywords)
      else
        nil
      end
    end

    # Returns a String of the web page's highest ranking text snippet from the
    # query (@q). Anything matching @q is set in bold.
    def text
      # .dup is required because the String is frozen.
      embold(@doc.text.first.dup)
    end

    # Returns a String of the webpage's url.
    def url
      @doc.url
    end

  private

    # Embolds instances of @q in s (String).
    def embold(s)
      regex = Regexp.new(@q, true) # Case insensitive.
      match = regex.match(s)
      s.gsub!(regex, "<b>#{match.to_s}</b>") if match
      s
    end
  end
end
