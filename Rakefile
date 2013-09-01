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
  if File.exists? "tmp/bootstrap-sass"
    `cd tmp/bootstrap-sass && git pull`
  else
    `git clone git://github.com/thomas-mcdonald/bootstrap-sass.git tmp/bootstrap-sass`
  end
end

desc 'Dumps output to a CSS file for testing'
task :css => :sync do
  File.open("./todc-bootstrap.final.css", 'w') { |f| f.write(sass_engine.render) }
end

desc 'Translate less to scss'
task :translate do
  todc_path = "tmp/todc-bootstrap"
  less_path = "#{todc_path}/less"
  scss_path = 'tmp/scss'

  if File.exists? todc_path
    `cd #{todc_path} && git pull`
  else
    `git clone git://github.com/todc/todc-bootstrap.git #{todc_path}`
  end

  FileUtils.mkdir_p scss_path

  Dir["#{less_path}/*.less"].each do |less|
    File.open(less) do |lf|
      buffer = lf.read.gsub(/@((?!mixin|include|while|import|media)\w+)/, "$\\1") # translate less variable: @color -> $color
        .gsub(/^\.(\S+)(\s?)\(/, "@mixin \\1\\2(") # translate less mixin defination: .box-shadow(xxxxxx) { -> @mixin box-shadown(xxxx) {
        .gsub(/\s\.(\S+)(\s?)\(/, " @include \\1\\2(") # translate less function: .box-shadow(xxxx) -> @include box-shadow(xxxx)
        .gsub(/#(\S+) > @include (\S+)\(/, "@include \\1-\\2(") # translate special less fucntion: #aaa > .bbb()  -> @include aaa-bbb()
        .gsub(/\(~"(.+)"\)/,"(\\1)") # replace less escaping tag ~: box-shadow(~"xxx,x,x,x,xx,")
        .gsub(/e\("(\S+)"\)/,"\\1") # replace e('\9')
        .gsub(/\.\.\/img\/checkmark\.png/, "$iconCheckMarkPath")
      File.open("tmp/scss/_#{File.basename(less, ".*")}.scss", 'w+') { |f| f.write buffer }
    end
  end

  `patch -f #{scss_path}/_labels-badges.scss < labels_badges.patch`
  `patch -f #{scss_path}/_variables.scss < variables.patch`

end

desc "upgrade from todc-bootstrap"
task :upgrade => [:translate] do
  scss_path = "tmp/scss"
  dist = "lib/assets/stylesheets/todc-bootstrap"

  FileUtils.mv "#{scss_path}/_mixins.scss", "#{scss_path}/_todc-mixins.scss"
  FileUtils.rm "#{scss_path}/_todc-bootstrap.scss"

  Dir["#{scss_path}/*.scss"].each do |f|
    FileUtils.mv f, "#{dist}"
  end
end
