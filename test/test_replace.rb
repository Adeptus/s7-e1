require 'test/unit'
require_relative '../lib/replace.rb'
require_relative '../lib/result.rb'

class ReplaceTest < Test::Unit::TestCase

  def teardown
    %x[sed s/test/file/g test/data/a.txt > test/data/b.txt]
    %x[sed s/test/file/g test/data/b.txt > test/data/a.txt]
  end 

  def test_replace_word_in_file
    @solver = Replace.new([Result.new("#{File.dirname(__FILE__)}/data/a.txt",
                                      2,
                                      "Sample file\n")],
                          "file",
                          "test")
    @solver.execute

   assert_match /test/, File.new("#{File.dirname(__FILE__)}/data/a.txt", "r").read
  end
end
