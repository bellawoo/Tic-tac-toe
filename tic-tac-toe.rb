class Tic_tac_toe
	#Initialize the game
	def initialize
		#build the board
		@board = [[],[],[]]
	end

	def over?
		#determine when the game is over
	end

	#show the board
	attr_reader :board

	def check_board position
		#checks to see if the positioni requested is already taken
	end

	def position_empty
		#what to do if the position chosen is empty
	else 
		#throw invalid error because position was taken
	end

	def three_row?
		# Are there 3 in a row?
	end

end

until over?
	# repeats Tic_tac_toe class
end