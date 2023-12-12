class Dictionary
  attr_reader :word

  def initialize(dictionary)
    @dictionary = dictionary
    @word = nil
  end

  def valid_word(word)
    word_hash = create_hash_from_word(word)

    @dictionary.any? do |key, words|
      words.any? do |dict_word|
        if word.length < dict_word.length
          dict_word_includes_word_chars(dict_word, word_hash.clone)
        else
          false
        end
      end
    end
  end

  def create_hash_from_word(word)
    hash = Hash.new(0)
    word.each { |char| hash[char] +=1 }
    hash
  end

  def dict_word_includes_word_chars(dict_word, word_hash)
    dict_word.each_char do |char|
      word_hash[char] -= 1
    end

    word_hash.all? { |key, value| value <= 0 }
  end

  def have_word?(word)
    word_hash = create_hash_from_word(word)

    word.any? do |char|
      dict_words = @dictionary[char]

      dict_words.any? do |dict_word|
        if dict_word.length == word.length && dict_word_includes_word_chars(dict_word, word_hash.clone)
          @word = dict_word
          true
        else
          false
        end
      end
    end
  end

end
