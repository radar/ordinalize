begin
  require 'rubygems'
rescue LoadError; end
require 'humanize'

module Ordinalize
  def ordinalize
    humanized = self.humanize
    # 13-19
    humanized += "th" if humanized =~ /teen$/
    
    # 20, 30, 40, etc.
    humanized.gsub!(/ty$/, 'tieth')
    
    output = conversions[humanized] if conversions[humanized]
    output ||= split if split != ""
    output ||= humanized
  end
  
  alias_method :ordinalise, :ordinalize
  
  def split
    humanized = self.humanize
    parts = humanized.split("-")
    parts[-1] = conversions[parts.last]
    parts.join("-")
  end
  
  def conversions
    {
      "one" => "first",
      "two" => "second",
      "three" => "third", 
      "four" => "fourth",
      "five" => "fifth", 
      "six" => "sixth",
      "seven" => "seventh", 
      "eight" => "eighth",
      "nine" => "ninth", 
      "ten" => "tenth",
      "eleven" => "eleventh", 
      "twelve" => "twelveth",
    }
  end
end

class Numeric
  include Ordinalize
end
