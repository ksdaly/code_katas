class PigLatinTranslation
  attr_reader :phrase

  def initialize(phrase)
    @phrase = phrase.downcase.gsub(/[.]/, "")
  end

  #provide the pig latin translation
  def translate
    words.each do |word|
      if starts_with_vowel?(word)
        word + "way"
      else
        consonants = consequitive_consonants(word)
        word.gsub(/#{consonants}/, "") + consonants.to_s + "ay"
      end
    end
  end

  private
  #an array of words in the phrase
  def words
    phrase.split
  end

  def starts_with_vowel?(word)
    /^[aeiou]/.match(word)
  end

  def consequitive_consonants(word)
    /\b([bcdfghjklmnprstvwxyz])+/.match(word)
  end
end

test = PigLatinTranslation.new("This will be translated into pig latin.")
test.translate

