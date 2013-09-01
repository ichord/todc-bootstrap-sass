$:.unshift("#{File.dirname(__FILE__)}/..")

require 'sass'
require 'lib/todc-bootstrap-sass/compass_functions'
require 'lib/todc-bootstrap-sass/rails_functions'

def sass_engine
  path = 'lib/assets/stylesheets'
  bootstrap_sass_path = "tmp/bootstrap-sass/vendor/assets/stylesheets"
  content = <<-END
  @import "bootstrap";
  @import "todc-bootstrap";
  END
  testing_scss = "./tmp/todc-bootstrap-testing"
  File.open(testing_scss, 'w') { |f| f.write(content)}

  engine = Sass::Engine.for_file(testing_scss, syntax: :scss, load_paths: [bootstrap_sass_path, path])
end
