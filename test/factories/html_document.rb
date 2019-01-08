require 'faker'

# factory class mimicing the Wgit::Document class
class Document
  attr_accessor :title, :keywords, :text, :url

  def initialize
    @title    = Faker::Commerce.unique.product_name
    @keywords = Faker::Lorem.unique.words(5)
    @text     = [Faker::Hacker.unique.say_something_smart[0..80].strip]
    @url      = Faker::Internet.unique.url
  end
end
