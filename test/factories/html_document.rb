require 'faker'

# factory class mimicing the Wgit::Document class
class Document
  attr_accessor :title, :text, :url

  def initialize
    @title = Faker::Commerce.unique.product_name
    @text  = Faker::Hacker.unique.say_something_smart[0..80].strip
    @url   = Faker::Internet.unique.url
  end
end
