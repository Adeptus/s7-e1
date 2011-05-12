module GrepWrapper
  class Grep
    attr_accessor :regex, :path, :options

    def initialize
      @path = Dir.pwd
      @options = "-rin"
    end
    
    def find_match_by_grep
      out = []
     
      grep_output = IO.popen("grep #{options} #{regex} #{path}")
   
      grep_output.each {|one_match| out.push(one_match)}
      
      out
    end
  endend
