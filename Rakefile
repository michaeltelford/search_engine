require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList['test/**/*_test.rb']
end

task :default => :test

desc "Compile and view the slim templates"
task :compile do
  html = `slimrb -p lib/search_engine/views/search.slim`
  file_path = "html/search.html"
  File.delete file_path if File.exist? file_path
  File.open file_path, "w" do |f|
    f.puts html
  end
  `open #{file_path}` # opens html file in browser
end
