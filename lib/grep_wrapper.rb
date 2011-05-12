require File.dirname(__FILE__) + '/grep_wrapper/grep.rb'

module GrepWrapper
  class Wrapper

    attr_accessor :command_attributes, :grep

    def initialize
      @grep = Grep.new
    end

    def start
      return syntax_info if @command_attributes[0] == nil
      return help_info   if @command_attributes[0] == "--help"
      
      organize_command_attributes

      grep.find_match_by_grep
    end

  private
    
    def organize_command_attributes
      if @command_attributes[0].start_with?("-")
        grep.options = @command_attributes[0]
        grep.regex   = @command_attributes[1]
        grep.path    = @command_attributes[2] if @command_attributes[2]
      else
        grep.regex   = @command_attributes[0]
        grep.path    = @command_attributes[1] if @command_attributes[1]
      end
    end

    def syntax_info
    return "syntax: grep_wrapper [attributes]... REGEX [PATH]\n" \
           "Write 'grep_wrapper --help' to know more\n"
    end

    def help_info
      return "help info\n"
    end
  end
end
