require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  # t.ruby_opts = ["-W0", "-W:deprecated"]
  t.libs << "test"
  # t.libs << "libs"
  t.test_files = FileList['test/**/*_test.rb']
end

desc "Run tests"
task default: :test