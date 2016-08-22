require 'colorize'

module RLE_Utils

  BASE_LINE_LENGTH = 16

  def self.expand(input, length)
    result = input.gsub(/(\d+[A-Z]+)/) do |element|
      captures = element.match(/(\d+)([A-Z])/).captures
      captures.last * captures.first.to_i
    end
    result.split("").each_slice(length).map{|e| e}
  end

  def self.decode(data)
    data.map { |row| row.map { |e| e == "B" ?  "\u2588".white : "\u2588".black } }
  end

  def self.display(filename, length = BASE_LINE_LENGTH)
    text = open(filename).readlines.first.chomp!
    expanded = expand(text, length)
    decoded = decode(expanded)
    decoded.each { |row| puts row.join }
    nil
  end
end
