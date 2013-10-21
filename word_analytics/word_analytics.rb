class WordAnalytics

  def initialize(string)
    @string = string
  end

  def count_words
    hash = {}
    @string.split(/ /).each do |word|
      if word.match(/\w/)
        word = word.gsub(/\W/, "").downcase
        hash[word] ||= 0
        hash[word] +=1
      end
    end
    hash
  end

  def count_letters
    hash = {}
    @string.split(//).each do |character|
      character.downcase!
      if character.match(/[a-z]/)
        hash[character] ||= 0
        hash[character] += 1
      end
    end
    hash
  end

  def count_symbols
    hash = {}
    @string.split(//).each do |symbol|
      if symbol.match(/[^\w\s]/)
        hash[symbol] ||= 0
        hash[symbol] += 1
      end
    end
    hash
  end

  def common_words
    array = count_words.sort_by {|k,v| v}.reverse
    array.map {|x| x[0]}[0..2]
  end

  def common_letters
    array = count_letters.sort_by {|k,v| v}.reverse
    array.map {|x| x[0]}[0..2]
  end

  def single_words
    count_words.select{|k,v| v == 1 }.count
  end


end
