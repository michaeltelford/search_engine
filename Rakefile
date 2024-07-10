# require 'bundler/gem_tasks'
require 'rake/testtask'
require 'dotenv/tasks'

DEV_PORT          = 8080
DEFAULT_PROD_PORT = 80

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList['test/**/*_test.rb']
end

desc "Print help information"
task default: :help

desc "Print help information"
task :help do
  system "bundle exec rake -D"
end

desc "Compile all project Ruby files with warnings"
task :compile do
  paths = Dir["**/*.rb"]
  paths.each do |f|
    puts "\nCompiling #{f}..."
    puts `ruby -cw #{f}`
  end
end

desc "Start the application on port #{DEV_PORT}"
task :serve do
  system "RACK_ENV=development bundle exec rackup -p #{DEV_PORT}"
end

desc "Start the application in production on port ENV['PORT'] || #{DEFAULT_PROD_PORT}"
task serve!: :dotenv do
  port = ENV['PORT'] || DEFAULT_PROD_PORT
  system "RACK_ENV=production bundle exec rackup -p #{port}"
end

desc "Open the app in a browser"
task :open do
  puts "You may need to refresh the webpage to see the app..."
  system "open 'http://localhost:#{DEV_PORT}'"
end

desc "Start app and open in browser"
task :browse => [:open, :serve]

desc "Index webpages for the production Wgit demo search engine app"
task :index_webpages do
  puts "Enter the production MongoDB connection string:"
  connection_str = STDIN.gets.strip # Blocks for user input

  system "WGIT_CONNECTION_STRING=\"#{connection_str}\" ./index_webpages.rb"
end
