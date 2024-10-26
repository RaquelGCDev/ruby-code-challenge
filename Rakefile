require 'minitest/test_task'
require 'rubocop/rake_task'
require 'rspec/core/rake_task'


desc 'Run the application'
task :run do
  ruby 'lib/main.rb'
end

RuboCop::RakeTask.new(:lint) do |t|
  t.patterns = ['lib/**/*.rb', 'test/**/*.rb']
end

Minitest::TestTask.create(:minitest) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.warning = false
  t.test_globs = ['test/**/*_test.rb']
end

RSpec::Core::RakeTask.new(:rspec) do |t|
  t.pattern = 'test/**/*_spec.rb'
end

task test: [:minitest, :rspec]

task default: %w[lint test]
