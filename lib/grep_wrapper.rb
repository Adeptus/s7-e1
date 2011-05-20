require_relative 'grep.rb'
require_relative 'replace.rb'

class GrepWrapper
  attr_reader :parameters

  def initialize(regex, path, options = nil, replace = nil)
    @parameters = {}
    
    @parameters[:regex]   = regex
    @parameters[:path]    = path
    @parameters[:options] = options  if options
    @parameters[:replace] = replace  if replace
  end

  def execute
     grep_output  = Grep.new(@parameters[:regex],
                             @parameters[:path],
                             @parameters[:options]).execute

     if @parameters[:options].index("X")
       Replace.new(grep_output,
                   @parameters[:regex],
                   @parameters[:replace]).execute
     end

     grep_output
  end
end
