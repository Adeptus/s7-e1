class Replace

  attr_reader :files_arr, :desired_string, :new_string

  def initialize(grep_output, search_string, new_string)
    @files_arr      = parse_grep_output(grep_output)
    @desired_string = search_string
    @new_string     = new_string
  end

  def execute
    replace
  end

private

  def parse_grep_output(grep_output)
    grep_output.inject([]) do |new_output, line|
      new_output << parse_line(line)
    end
  end

  def parse_line(line)
    path, number = line.split(":")
    text         = line.split(/:[0-9]*:/).last

    return path, number.to_i, text 
  end

  def replace
    @files_arr.each {|file_arr| replace_line_in_file(file_arr)}
  end

  def replace_line_in_file(file_arr)
    File.open(file_arr[0], 'r+') do |file|
      lines = file.readlines
      lines[file_arr[1]-1].gsub!(/#{@desired_string}/, "#{@new_string}")
      file.rewind
      file.write(lines) 
    end
  end
end

