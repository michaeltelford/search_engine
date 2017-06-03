require "bundler/gem_tasks"
require "rake/testtask"

DEV_PORT  = 8080
PROD_PORT = 80

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList['test/**/*_test.rb']
end

task :default => :test

desc "Start the application on port #{DEV_PORT}"
task :serve do
  system "bundle exec rackup -p #{DEV_PORT}"
end

desc "Start the application in production on port #{PROD_PORT}"
task :serve! do
  system "bundle exec rackup -p #{PROD_PORT}"
end

desc "Open the app in a browser"
task :open do
  puts "You may need to refresh the webpage to see the app..."
  system "open 'http://localhost:#{DEV_PORT}'"
end

desc "Start app and open in browser"
task :browse => [:open, :serve]
