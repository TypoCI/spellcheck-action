# This combines all the context (programming languages and other terms) into a
# single file. Which should improve performance.
class Dictionaries::CombineService
  def initialize
    @input_directory = Rails.root.join('db', 'dict', 'contextual')
    @output_directory = Rails.root.join('db', 'dict', 'combined_contextual')
    @words = []
  end

  def call
    build_word_list
    write_word_list
  end

  private

  def build_word_list
    @words = @input_directory.glob('*.dic').collect do |dictionary_file|
      dictionary_file.readlines.drop(1).collect(&:strip)
    end.flatten.uniq.sort.select(&:present?)
  end

  def write_word_list
    @output_directory.join('combined.dic').open('w') do |f|
      f << "#{@words.size}\n"
      f << @words.join("\n")
    end
  end
end
