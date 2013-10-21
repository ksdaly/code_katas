require 'rspec'
require_relative 'word_analytics'

describe WordAnalytics do

  let(:string) { WordAnalytics.new("Word word word phrase phrase string") }
  let(:short_string) { WordAnalytics.new("Wwwwooordd word.") }
  let(:symbol_string) { WordAnalytics.new("Word && 9 word.") }
  it "returns the number of each word" do
    expect(string.count_words).to eql({
      "word" => 3,
      "phrase" => 2,
      "string" => 1
      })
  end

  it "returns the number of each letter" do
    expect(short_string.count_letters).to eql({
      "w" => 5,
      "o" => 4,
      "r" => 2,
      "d" => 3
      })
  end

  it "returns the number of each symbol" do
    expect(symbol_string.count_symbols).to eql({
      "&" => 2,
      "." => 1
      })
  end

  it "returns 3 most common words" do
    expect(string.common_words).to eql(["word", "phrase", "string"])
  end

  it "returns 3 most common letters" do
    expect(short_string.common_letters).to eql(["w","o","d"])
  end

  it "returns number of words used once" do
    expect(string.single_words).to eql(1)
  end

end
