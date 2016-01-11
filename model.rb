class Deck
  attr_reader :deck_of_cards

  def initialize
    @deck_of_cards = []
    import_deck_from_file_into_array
    format_array
  end

  def show_a_card_definition
    @deck_of_cards[0].definition
  end

  def show_a_card_answer
    @deck_of_cards[0].answer
  end

  def compare_card_answer_to_user_input(user_input)
    if @deck_of_cards[0].answer == user_input
      remove_card_from_deck
      p "it's a match!"
    else
      @deck_of_cards.rotate
      p "guess again!"
    end
  end

  def card_count
    @deck_of_cards.length
  end

private

  def remove_card_from_deck
    @deck_of_cards.delete_at(0)
  end

  def import_deck_from_file_into_array
      File.open("flashcard_samples.txt").each do |line|
        @deck_of_cards << line.chomp
      end
  end

  def create_array_representing_each_card
    # this method gets used in divide_larger_array_into_smaller_arrays
    @array_representing_each_card = []
    2.times do
      @array_representing_each_card << @deck_of_cards[0]
      @deck_of_cards.delete_at(0)
    end
  end

  def format_array
    remove_empty_spaces_from_array
    divide_larger_array_into_smaller_arrays
    refill_deck_array_with_inner_arrays_from_placeholder
    assign_each_inner_array_as_new_object
  end

  def remove_empty_spaces_from_array
  # this method used in format_array
    @deck_of_cards.delete("")
  end

  def divide_larger_array_into_smaller_arrays
  # this method used in format_array
    @temporary_placeholder_array = []
    until @deck_of_cards.length == 0
      create_array_representing_each_card
      @temporary_placeholder_array << @array_representing_each_card
    end
  end

  def refill_deck_array_with_inner_arrays_from_placeholder
    # this method used in format_array
    @deck_of_cards = @temporary_placeholder_array
  end

  def assign_each_inner_array_as_new_object
    # this method used in format_array
    @deck_of_cards.map! { |inner_array| Card.new(inner_array) }
  end


end

class Card
  attr_reader :definition, :answer

  def initialize(array)
    @definition = array[0]
    @answer = array[1]
  end

end
