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
      output = less_than_hundred_thousand(self)
    when 1000...10000
      output = less_than_ten_thousand(self)
    when 100...1000
      output = less_than_one_thousand(self)
    when 0..100
      output = less_than_one_hundred(self)
    end
  output.squeeze(' ').rstrip
  end

  def less_than_hundred_thousand(n)
    "#{less_than_one_hundred(n.div(1000))}#{less_than_ten_thousand(n)}"
  end

  def less_than_ten_thousand(n)
    thousands = n.div(1000)
    rest = less_than_one_thousand(n % 1000) unless (n % 1000 == 0)
    "#{Fixnum.units[thousands]} thousand #{rest}"
  end

  def less_than_one_thousand(n)
    hundreds, rest = n.div(100), less_than_one_hundred(n % 100)
    "#{Fixnum.units[hundreds]} hundred #{rest}"
  end

  def less_than_one_hundred(n)
    if n == 0
      return ""
    end
    if n.between?(11, 20)
      return "#{Fixnum.teens[n - 11]}"
    elsif n.between?(-1, 9)
      return "#{Fixnum.units[n]}"
    end
    first, second = n.div(10), n % 10
    if second > 0
      unit = Fixnum.units[second]
    end
    "#{Fixnum.tens[first-1]} #{unit}"
  end

end