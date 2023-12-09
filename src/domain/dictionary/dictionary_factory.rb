require_relative './dictionary'

class DictionaryFactory
  def initialize(file_reader)
    @file_reader = file_reader
  end

  def create(file_name)
    dictionary = @file_reader.get_hashed_words_from_file(file_name)
    Dictionary.new(dictionary)
  end
end
