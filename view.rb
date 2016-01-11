class View

	attr_reader :user_guess

	def initialize
		@user_guess =""
	end
	
	def welcome
		puts "Welcome to the Flashcard Game."
		puts "Here's your first definition."
	end

	def game_instructions
		puts
		puts "The Definition:"
	end

	def ask_user_to_guess
		puts
		puts "Your Guess:"

		@user_guess = gets.chomp
	end

	def tell_user_grade(result)
		if result
			"Your guess is correct!"
		else
			"Your result if wrong!"
		end

	end

end