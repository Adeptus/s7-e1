require "tempfile"
require "fileutils"

class Replace

  attr_reader :result_array, :desired_string, :new_string

  def initialize(grep_output, search_string, new_string)
    @result_array   = grep_output
    @desired_string = search_string
    @new_string     = new_string
  end

  def replace
    @result_array.each {|result| replace_line_in_file(result)}
  end

  alias_method :execute, :replace

private

  def replace_line_in_file(result)
    temp = Tempfile.new("temp")

    File.foreach(result.file_name) do |line|
      if line == result.text
        temp << line.gsub!(/#{@desired_string}/, "#{@new_string}")
      else
        temp << line  
      end
    end

    temp.close
    FileUtils.mv(temp.path, result.file_name)
  end
end

