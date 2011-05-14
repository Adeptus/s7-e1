require 'test/unit'
require './lib/grep.rb'

class GrepTest < Test::Unit::TestCase

  def test_find_string_crazy_in_test_data_files
    @solver = Grep.new("Crazy", "./test/data/")
    function_output = @solver.execute

    assert_match /.*Crazy.*/, function_output[0]
  end

  def test_find_word_sample_in_test_data_files
    @solver = Grep.new("Sample", "./test/data/")
    function_output = @solver.execute

    assert_match /Sample/, function_output[0]
    assert_equal 3, function_output.count
  end

  def test_no_find_eny_word_grep_in_test_data_files
    @solver = Grep.new("grep", "./test/data/")
    function_output = @solver.execute

    assert_equal [], function_output
  end

end
