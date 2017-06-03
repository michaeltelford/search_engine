require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList['test/**/*_test.rb']
end

task :default => :test

TEMPLATE_PATH = "lib/search_engine/views/search.slim"
HTML_PATH     = "lib/search_engine/public/html/search.html"

desc "Compile the slim templates into html"
task :compile do
  html = `slimrb -p #{TEMPLATE_PATH}`
  File.delete HTML_PATH if File.exist? HTML_PATH
  File.open HTML_PATH, "w" do |f|
    f.puts html
  end
end

desc "Compile and view slim templates html in a browser"
task :view => :compile do
  `open #{HTML_PATH}` # opens html file in browser
end
