require 'test/unit'
require './lib/grep_wrapper.rb'

class GrepWrapperTest < Test::Unit::TestCase

  def teardown
    %x[sed s/off/on/g test/data/a.txt > test/data/b.txt]
    %x[sed s/off/on/g test/data/b.txt > test/data/a.txt]
    %x[sed s/off/on/g test/data/b.txt > test/data/c.txt]
  end 

  def test_change_swither_in_few_files
    @solver = GrepWrapper.new("= on", "./test/data/", "rX", "= off")
    @solver.execute    

    assert_match /off/, File.new("./test/data/a.txt", "r").read
  end
end
