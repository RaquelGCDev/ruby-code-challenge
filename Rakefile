require 'minitest/test_task'
require 'rubocop/rake_task'


desc 'Run the application'
task :run do
  ruby 'lib/main.rb'
end

RuboCop::RakeTask.new(:lint) do |t|
  t.patterns = ['lib/**/*.rb', 'test/**/*.rb']
end

Minitest::TestTask.create(:test) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.warning = false
  t.test_globs = ['test/**/*_test.rb']
end

task default: %w[lint test]
