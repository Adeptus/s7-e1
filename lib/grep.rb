require './lib/result.rb'

class Grep 
  attr_reader :regex, :path, :options 
    
  DEFAULT_OPTIONS = "-nH"
 
  def initialize(search_regex, path, options = nil)
    @options  = DEFAULT_OPTIONS
    @options += options.delete("X") unless options.nil? or options == "X"
    @regex    = search_regex
    @path     = path
  end

  def execute
    grep_output = find_match_by_grep
    return parse_grep_output(grep_output)
  end
     
private

  def find_match_by_grep 
    grep_output = IO.popen("grep #{@options} '#{@regex}' #{@path}") 
    return grep_output.inject([]) { |out, match| out <<  match }
  end

  def parse_grep_output(grep_output)
    grep_output.inject([]) do |new_output, line|
      new_output << parse_line(line)
    end
  end

  def parse_line(line)
    file, number = line.split(":")
    text         = line.split(/:[0-9]*:/).last

    Result.new(file, number.to_i, text)
  end
end
