require 'test/unit'
require './lib/grep_wrapper/grep.rb'

class GrepTest < Test::Unit::TestCase

  def setup
    @solver = GrepWrapper::Grep.new
  end

  def test_find_string_crazy_in_this_test
    @solver.regex   = "Crazy"
    @solver.options = "-rl"

    assert_equal [Dir.pwd + "/tests/test_grep.rb\n"], @solver.find_match_by_grep
  end

end
