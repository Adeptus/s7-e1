class Replace

  attr_reader :result_array, :desired_string, :new_string

  def initialize(grep_output, search_string, new_string)
    @result_array   = grep_output
    @desired_string = search_string
    @new_string     = new_string
  end

  def execute
    replace
  end

private

  def replace
    @result_array.each {|result| replace_line_in_file(result)}
  end

  def replace_line_in_file(result)
    File.open(result.file_name, 'r+') do |file|
      lines = file.readlines
      lines[result.line_number - 1].gsub!(/#{@desired_string}/, "#{@new_string}")
      file.rewind
      file.write(lines) 
    end
  end
end

