class Dictionary
  def initialize(dictionary)
    @dictionary = dictionary
  end

  def valid_word(word)
    word_hash = create_hash_from_word(word)

    @dictionary.any? do |dict_key, value|
      value.any? do |sub_key, words|
        words.any? do |dict_word|
          if word.length < dict_word.length
            dict_word_includes_word_chars(dict_word, word_hash.clone)
          else
            false
          end
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
    dict_word.each do |char|
      word_hash[char] -= 1
    end

    word_hash.all? { |key, value| value <= 0 }
  end

end
