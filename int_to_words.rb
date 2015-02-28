require "pry"

class Fixnum

  def self.units
    ['zero','one','two','three','four','five','six','seven','eight','nine']
  end

  def self.teens
    ['eleven','twelve','thirteen','fourteen','fifteen','sixteen','seventeen','eighteen','nineteen']
  end

  def self.tens
    ['ten','twenty','thirty','fourty','fifty','sixty','seventy','eighty','ninety']
  end


  def to_words

  output = ""


  case self
    when 100000...1000000
      # puts "x hundred thousand and..."
    when 10000...100000
      # puts "tens thousand and .."
    when 1000...10000
      # puts "units thousand and ..."
    when 100...1000
      output = less_than_one_thousand(self)
    when 10, 20...100
      output = less_than_one_hundred(self)
    when 11...20
      output = Fixnum.teens[self - 11]
    when 0...10
      output = Fixnum.units[self]
    end
  output
  end

  def less_than_one_thousand(n)
    hundreds, rest = n.div(100), less_than_one_hundred(n % 100)
    "#{Fixnum.units[hundreds]} hundred #{rest}"
  end

  def less_than_one_hundred(n)
    binding.pry
    if n == 0
      return ""
    end
    first, second = n.div(10), n % 10
    if second > 0
      unit = Fixnum.units[second]
    end
    "#{Fixnum.tens[first-1]} #{unit}"
  end

end