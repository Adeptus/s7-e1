require 'test/unit'
require './lib/Grep.rb'

class AssertionsTest < Test::Unit::TestCase

  def setup
    @solver = Grep.new
  end

  def test_find_string_crazy_in_this_test
    @solver.searching_string = "Crazy"
    assert_match /Crazy/, @solver.find_string_by_grep
  end

end
