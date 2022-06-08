require "faker"

# Mock search result which uses faker instead of wgit to populate the title
# etc. This way the tests aren't dependant on an external lib or database.
class MockSearchResult
  DEFAULT_TITLE = SearchEngine::SearchResult::DEFAULT_TITLE
  NUM_KEYWORDS = SearchEngine::SearchResult::NUM_KEYWORDS
  MAX_TEXT_LENGTH = SearchEngine::SearchResult::MAX_TEXT_LENGTH

  attr_reader :title, :keywords, :text, :url, :score

  def initialize
    @title =  randomise(5) ? DEFAULT_TITLE : Faker::Commerce.unique.product_name
    @keywords = if randomise(3)
                  nil
                else
                  str = Faker::Lorem.unique.words(number: NUM_KEYWORDS).join(", ")
                  mark(str, index: 1, delimiter: ", ")
                end
    @text = mark(Faker::Hacker.unique.say_something_smart[0..MAX_TEXT_LENGTH], index: -3)
    @url = Faker::Internet.unique.url
    @score = rand(0.2...27.9).round(2)
  end

private

  # Has a one in n chance of returning true.
  def randomise(n)
    arr = Array(1..n)
    arr.sample == arr[arr.length / 2]
  end
  
  # Adds a <mark> tag to the nth (index) word in str.
  # We don't mark test data because the test data comes from faker, so we don't know
  # how to assert which word is being marked.
  def mark(str, index:, delimiter: " ")
    return str if ENV["RACK_ENV"] == "test"
    
    words = str.split(delimiter)
    words[index] = "<mark>#{words[index]}</mark>"
    words.join(delimiter)
  end
end
