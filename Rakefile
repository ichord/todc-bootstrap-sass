#!/usr/bin/env rake
require "bundler/gem_tasks"
require 'rake/testtask'
require './test/supports'

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/*_test.rb']
  t.verbose = true
end

desc "sync bootstrap-sass"
task :sync do
  `git clone git://github.com/thomas-mcdonald/bootstrap-sass.git tmp/bootstrap-sass`
end

desc 'Dumps output to a CSS file for testing'
task :css => :sync do
  File.open("./bootstrap-google.final.css", 'w') { |f| f.write(sass_engine.render) }
end
