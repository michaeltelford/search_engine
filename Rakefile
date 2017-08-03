require 'bundler/gem_tasks'
require 'dotenv/tasks'
require 'rake/testtask'

DEV_PORT          = 8080
DEFAULT_PROD_PORT = 80

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList['test/**/*_test.rb']
end

task :default => :test

desc "Start the application on port #{DEV_PORT}"
task :serve do
  system "RACK_ENV=development bundle exec rackup -p #{DEV_PORT}"
end

desc "Start the application in production on port ENV['PORT'] || #{DEFAULT_PROD_PORT}"
task serve!: :dotenv do
  port = ENV['PORT'] || DEFAULT_PROD_PORT
  system "RACK_ENV=production bundle exec rackup -p #{port}"
end

desc "Start the application using the 'heroku local' command"
task :heroku do
  system "heroku local"
end

desc "Open the app in a browser"
task :open do
  puts "You may need to refresh the webpage to see the app..."
  system "open 'http://localhost:#{DEV_PORT}'"
end

desc "Start app and open in browser"
task :browse => [:open, :serve]
