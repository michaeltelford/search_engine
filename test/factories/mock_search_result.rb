require 'faker'

# Mock search result which uses faker instead of wgit to populate the title
# etc. This way the tests aren't dependant on an external lib or database.
class MockSearchResult
  DEFAULT_TITLE = SearchEngine::SearchResult::DEFAULT_TITLE
  NUM_KEYWORDS = SearchEngine::SearchResult::NUM_KEYWORDS
  MAX_TEXT_LENGTH = SearchEngine::SearchResult::MAX_TEXT_LENGTH

  attr_reader :title, :keywords, :text, :url

  def initialize
    @title =  if randomise(5)
                DEFAULT_TITLE
              else
                Faker::Commerce.unique.product_name
              end
    @keywords = if randomise(3)
                  nil
                else
                  Faker::Lorem.unique.words(number: NUM_KEYWORDS).join(', ')
                end
    @text = Faker::Hacker.unique.say_something_smart[0..MAX_TEXT_LENGTH]
    @url = Faker::Internet.unique.url
  end

private

  # Has a one in n chance of returning true.
  def randomise(n)
    arr = Array(1..n)
    arr.sample == arr[arr.length / 2]
  end
end
