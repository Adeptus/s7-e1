class Grep
  attr_accessor :searching_string, :path, :arguments

  def initialize
    @path = Dir.pwd    
    @arguments = "-rin"
  end
  
  def find_string_by_grep
   out = ""
   string = IO.popen("grep #{arguments} #{searching_string} #{path}")
   string.each {|a| out += a}
   out
  end
end
