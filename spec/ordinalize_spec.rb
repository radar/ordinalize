require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Ordinalize" do
  [
   [1, "first"],
   [2, "second"],
   [3, "third"],
   [4, "fourth"],
   [5, "fifth"],
   [6, "sixth"],
   [7, "seventh"],
   [8, "eighth"],
   [9, "ninth"],
   [10, "tenth"],
   [11, "eleventh"],
   [12, "twelveth"],
   [13, "thirteenth"],
   [14, "fourteenth"],
   [15, "fifteenth"],
   [16, "sixteenth"],
   [17, "seventeenth"],
   [18, "eighteenth"],
   [19, "nineteenth"],
   [20, "twentieth"],
   [21, "twenty-first"],
   [22, "twenty-second"],
   [23, "twenty-third"],
   [24, "twenty-fourth"],
   [25, "twenty-fifth"],
   [26, "twenty-sixth"],
   [27, "twenty-seventh"],
   [28, "twenty-eighth"],
   [29, "twenty-ninth"],
   [113, "one hundred and thirteenth"],
   [115, "one hundred and fifteenth"],
   [116, "one hundred and sixteenth"],
   [117, "one hundred and seventeenth"],
   [118, "one hundred and eighteenth"],
   [119, "one hundred and nineteenth"],
   [120, "one hundred and twentieth"],
   [121, "one hundred and twenty-first"],
   [122, "one hundred and twenty-second"],
   [1005, "one thousand and fifth"],
   [1024, "one thousand and twenty-fourth"]
  ].each do |num, expected|
    it "#{num} should be #{expected}" do
      num.ordinalize.should eql(expected)
    end
  end
  
  it "alternative spelling" do
    1.ordinalise.should eql("first")
  end
end
