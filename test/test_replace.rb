require 'test/unit'
require './lib/replace.rb'
require './lib/result.rb'

class ReplaceTest < Test::Unit::TestCase

  def teardown
    %x[sed s/test/file/g test/data/a.txt > test/data/b.txt]
    %x[sed s/test/file/g test/data/b.txt > test/data/a.txt]
  end 

  def test_replace_word_in_file
    @solver = Replace.new([Result.new("./test/data/a.txt", 2, "Sample file one")],
                          "file",
                          "test")
    @solver.execute

   assert_match /test/, File.new("./test/data/a.txt", "r").read
  end
end
