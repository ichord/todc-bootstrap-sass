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

desc 'Translate less to scss'
task :translate do
  todc_path = "tmp/todc-bootstrap"
  less_path = "#{todc_path}/less"
  scss_path = 'tmp/scss'

  `git clone git://github.com/todc/todc-bootstrap.git #{todc_path}`
  FileUtils.mkdir_p scss_path

  Dir["#{less_path}/*.less"].each do |less|
    File.open(less) do |lf|
      buffer = lf.read.gsub(/@((?!mixin|include|while|import|media)\S+)/, "$\\1")
        .gsub(/^\.(\S+)(\s?)\(/, "@mixin \\1\\2(")
        .gsub(/\s\.(\S+)(\s?)\(/, " @include \\1\\2(")
        .gsub(/#(\S+) > @include (\S+)\(/, "@include \\1-\\2(")
        .gsub(/\(~"(.+)"\)/,"(\\1)")
      # TODO: add patch
      File.open("tmp/scss/_#{File.basename(less, ".*")}.scss", 'w+') { |f| f.write buffer }
    end
  end
  FileUtils.mv "#{scss_path}/_mixins.scss", "#{scss_path}/_google-mixins.scss"

  `patch -f #{scss_path}/_labels-badges.scss < labels_badges.patch`
  `patch -f #{scss_path}/_variables.scss < image_path.patch`

end
