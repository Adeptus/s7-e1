require './lib/grep.rb'
require './lib/replace.rb'

class GrepWrapper
  attr_reader :regex, :path, :replace, :options

  def initialize(regex, path, options = nil, replace = nil)
    @regex   = regex
    @path    = path
    @options = options  if options
    @replace = replace  if replace
  end

  def execute
     output  = initializegrep.execute
     initializereplace(output).execute if @options.index("X")
     output
  end

private

  def initializegrep
    Grep.new(@regex, @path, @options)
  end

  def initializereplace(grep_output)
    Replace.new(grep_output, @regex, @replace)
  end
end
