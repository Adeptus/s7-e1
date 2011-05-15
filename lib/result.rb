class Result

  attr_reader :file_name, :line_number, :text

  def initialize(file, line_number, text)
    @file_name   = file
    @line_number = line_number
    @text        = text
  end
end
