require 'minitest/autorun'
require '../int_to_words'

class IntToWordsTest < MiniTest::Test
  describe "to_words" do
    it "should handle individual numbers" do
      1.to_words.must_equal("one")
      2.to_words.must_equal("two")
      3.to_words.must_equal("three")
    end

    it "should handle the teens" do
      16.to_words.must_equal("sixteen")
      19.to_words.must_equal("nineteen")
    end

    it "should handle hundreds" do
      123.to_words.must_equal("one hundred twenty three")
      100.to_words.must_equal("one hundred")
    end

    it "should handle hundreds" do
      1123.to_words.must_equal("one thousand one hundred twenty three")
      1100.to_words.must_equal("one thousand one hundred")
      1000.to_words.must_equal("one thousand")
    end

  end
end