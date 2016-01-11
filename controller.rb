require_relative 'model'
require_relative 'view'


class Controller

	def initialize
		@player = View.new
		@player.welcome
		@deck = Deck.new
		@player_output = ""
	end

	def how_many_cards_left
		@deck.card_count
	end

	def show_user_a_card
		@player.game_instructions
		puts @deck.show_a_card_definition
		puts "this is the answer"
		puts @deck.show_a_card_answer
		@player.ask_user_to_guess
	end

	def check_user_input_with_model
		@player_output = @player.user_guess
		@deck.compare_card_answer_to_user_input(@player_output)
	end

end

newgame = Controller.new

while newgame.how_many_cards_left > 0 do 
	newgame.show_user_a_card
	newgame.check_user_input_with_model
	sleep(2)
end

# p user.deck_of_cards
# user.compare_card_answer_to_user_input("alias")