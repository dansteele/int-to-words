class Fixnum

  UNITS = %w(\  one two three four five six seven eight nine)
  TEENS = %w(eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)
  TENS = %w(ten twenty thirty fourty fifty sixty seventy eighty ninety)

  def to_words
    case self
    when 100000...1000000
      less_than_million(self)
    when 10000...100000
      less_than_hundred_thousand(self)
    when 1000...10000
      less_than_ten_thousand(self)
    when 100...1000
      less_than_one_thousand(self)
    when 0..100
      less_than_one_hundred(self)
    end.squeeze(' ').rstrip
  end

  def less_than_million(n)
    "#{less_than_one_thousand(n.div(1000))}#{less_than_ten_thousand(n)}"
  end

  def less_than_hundred_thousand(n)
    "#{n.div(1000).to_words}#{less_than_ten_thousand(n)}"
  end

  def less_than_ten_thousand(n)
    out = UNITS[n.div(1000)] unless n.div(1000) == 0
    rest = less_than_one_thousand(n % 1000) unless n % 1000 == 0
    "#{out} thousand #{rest}"
  end

  def less_than_one_thousand(n)
    hundred = UNITS[n.div(100)] + ' hundred' unless n.div(100) == 0
    rest = less_than_one_hundred(n % 100) unless n % 100 == 0
    "#{hundred} #{rest}"
  end

  def less_than_one_hundred(n)
    return if n == 0
    return "#{TEENS[n - 11]}" if n.between?(11, 20)
    return "#{UNITS[n]}" if n.between?(-1, 9)

    first, second = n.div(10), n % 10
    unit = UNITS[second] if second > 0
    "#{TENS[first-1]} #{unit}"
  end
end
