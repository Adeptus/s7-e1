require 'test/unit'
require './lib/grep_wrapper.rb'

class GrepWrapperTest < Test::Unit::TestCase

  def setup
    @solver = GrepWrapper::Wrapper.new
  end


  def test_return_syntax_info_when_no_attributes_add_to_command
    @solver.command_attributes = []
    assert_match /syntax: grep_wrapper/, @solver.start
  end


  def test_return_help_info_when_add_help_attribute_to_command
    @solver.command_attributes = ["--help"]
    assert_match /help info/, @solver.start
  end


  def test_set_options_to_default_rin_when_no_options_add_to_command
    @solver.command_attributes = ["Regex"]
    @solver.start

    assert_equal "-rin", @solver.grep.options
  end


  def test_set_all_grep_parameters_from_command_attributes
    @solver.command_attributes = ["-l", "Regex", "./lib/"]
    @solver.start

    assert_equal "-l",     @solver.grep.options
    assert_equal "Regex",  @solver.grep.regex
    assert_equal "./lib/", @solver.grep.path
  end
end
