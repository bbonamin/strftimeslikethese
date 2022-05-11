# frozen_string_literal: true

guard :rubocop, cli: ['-A'] do
  watch(/.+\.rb$/)
  watch('Gemfile')
  watch(%r{(?:.+/)?\.rubocop(?:_todo)?\.yml$}) { |m| File.dirname(m[0]) }
end

guard :rake, task: :default do
  watch(%r{src/.+})
end

guard :rspec, cmd: 'bundle exec rspec' do
  require 'guard/rspec/dsl'
  dsl = Guard::RSpec::Dsl.new(self)

  # RSpec files
  rspec = dsl.rspec
  watch(rspec.spec_helper) { rspec.spec_dir }
  watch(rspec.spec_support) { rspec.spec_dir }
  watch(rspec.spec_files)

  # Ruby files
  ruby = dsl.ruby
  dsl.watch_spec_files_for(ruby.lib_files)

  watch(%r{src/(.*?).rb}) do |file|
    "spec/#{file[1]}_spec.rb"
  end
end
