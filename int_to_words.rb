class Fixnum
  def to_words

  output = ""

  units = ['zero','one','two','three','four','five','six','seven','eight','nine']
  teens = ['eleven','twelve','thirteen','fourteen','fifteen','sixteen','seventeen','eighteen','nineteen']
  tens = ['ten','twenty','thirty','fourty','fifty','sixty','seventy','eighty','ninety']

  case self
    when 100000...1000000
      # puts "x hundred thousand and..."
    when 10000...100000
      # puts "tens thousand and .."
    when 1000...10000
      # puts "units thousand and ..."
    when 100...1000
      # puts "units hundred and ... "
    when 10, 20...100
      first, second = self.div(10), self % 10
      if second > 0
        unit = units[second]
      end
      output = "#{tens[first-1]} #{unit}"

    when 11...20
      output = teens[self - 11]
    when 0...10
      output = units[self]
    end
  output
  end
end