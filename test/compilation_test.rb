require 'test_helper'

class CompilationTest < Test::Unit::TestCase
  def test_compilation
    assert_nothing_raised do
      sass_engine.render
    end
  end
end
