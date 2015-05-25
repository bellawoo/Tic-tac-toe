require 'pry'
class Tic_tac_toe
	#Initialize the game, board and two players
	attr_reader :move

	def initialize
		@board = Array.new(9,"-")
		puts "Welcome to Tic-Tac-Toe!"
		@turn = 1
	end

	def take_turn
		show_board
		@player = @turn.odd ? 1 : 2
		@symbol = @turn.odd ? "X" : "O"
		puts "Player #{@symbol} it is your turn. Make your move by typing in the number of the square in which you want to play."
		check_board
	end

	def show_board
		puts "Testing to see if board works"
	end

	def check_board
		move = gets.chomp.to_i
		if (0..8).include?(move)
			if @board[move] == "-"
				make_play(move)
			else
				puts "Whoops! Looks like someone's already there. Try choosing another spot."
			end
		else
			puts "Oops! Looks like that's not a valid entry. Try again with a number from 0-8."
		end
	end

	def make_play
		
	end

	def win_combos
	# Possible wins
		[[0,1,2],
		[3,4,5],
		[6,7,8],
		[0,3,6],
		[1,4,7],
		[2,5,8],
		[0,4,8],
		[2,4,6]]
	end

	def three_row?
		win_combos.any?
	end

	def draw
		board.none?		
	end

	def over?
		#determine when the game is over
		three_row || draw
	end
end

game = Tic_tac_toe.new