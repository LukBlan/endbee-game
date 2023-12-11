class FileReader
  def get_hashed_words_from_file(file_name)
    words = get_hash_of_words

    File.foreach(file_name) do |word|
      read_word = word.chomp
      first_char = read_word[0]
      words[first_char] << read_word
    end

    words
  end

  def get_hash_of_words
    Hash.new do |hash, key|
      hash[key] = []
    end
  end
end
