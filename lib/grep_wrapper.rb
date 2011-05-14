require './lib/grep.rb'
require './lib/replace.rb'

class GrepWrapper
  attr_reader :regex, :path, :replace, :options

  def initialize(regex, path, replace, options = nil)
    @regex   = regex
    @path    = path
    @replace = replace
    @options = options if options
  end

  def execute
     output  = initializegrep.execute
     initializereplace(output).execute
     print output
  end

private

  def initializegrep
    Grep.new(@regex, @path, @options)
  end

  def initializereplace(grep_output)
    Replace.new(grep_output, @regex, @replace)
  end
end
