class Fixnum
  def to_words

  output = ""

  units = ['zero','one','two','three','four','five','six','seven','eight','nine']
  teens = ['eleven','twelve','thirteen','fourteen','fifteen','sixteen','seventeen','eighteen','nineteen']
  tens = ['ten','twenty','thirty','fourty','fifty','sixty','seventy','eighty','ninety']

  case self
    when 100000...1000000
      puts "x hundred thousand and..."
    when 10000...100000
      puts "tens thousand and .."
    when 1000...10000
      puts "units thousand and ..."
    when 100...1000
      puts "units hundred and ... "
    when 10, 20...100
      puts "tens units"
    when 11...20
      puts "teen"
    when 0...10
      puts "unit"
    end

  end
end