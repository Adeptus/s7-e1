class Grep 
  attr_reader :regex, :path, :options 
    
  DEFAULT_OPTIONS = "-rnH"
 
  def initialize(search_regex, path, options = nil)
    @options  = DEFAULT_OPTIONS
    @options += "i" if options && options == "ignore case"
    @regex    = search_regex
    @path     = path
  end

  def execute
    find_match_by_grep
  end
     
private

  def find_match_by_grep 
    grep_output = IO.popen("grep #{@options} #{@regex} #{@path}") 
    return grep_output.inject([]) { |out, match| out <<  match }
  end
end
