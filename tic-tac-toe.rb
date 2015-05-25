class Tic_tac_toe
	#Initialize the game, board and two players
	attr_reader :move, :win_combos, :win

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
		puts "|#{@board[0]}|#{@board[1]}|#{@board[2]}|"
		puts "|---|---|---|"
		puts "|#{@board[3]}|#{@board[4]}|#{@board[5]}|"
		puts "|---|---|---|"
		puts "|#{@board[6]}|#{@board[7]}|#{@board[8]}|"
	end

	def check_board
		move = gets.chomp.to_i
		if (0..8).include?(move)
			if @board[move] == "-"
				make_play(move)
			else
				puts "Whoa there! Looks like someone's already there. Try choosing another spot."
			end
		else
			puts "Oops! Looks like that's not a valid entry. Try again with a number from 0-8."
		end
		choose_spot
	end

	def make_play move
		@board[move] = @symbol
		check_win = []
		board_full = 0
		@board.each_with_index do |move, i|
			check_win << i if move.include?(@symbol)
			board_full += 1 if move.include?("X") || move.include?("O")
		end
	end

	def win_combos
	# Possible wins
		win_combos = [[0,1,2],
		[3,4,5],
		[6,7,8],
		[0,3,6],
		[1,4,7],
		[2,5,8],
		[0,4,8],
		[2,4,6]]
	end

	def three_row?
		win = 0
		win_combos.each do |tic|
			tac_array = 0
			tic.each do |move|
				if check_win.include?(move)
					tac_array += 1
			end
			won = 1 if tac_array == 3
		end
		if win == 1
			return 1
		elsif board_full == 9
			return 2
		end
	end

	def over?
		#determine when the game is over
		if three_row? == 1
			show_board
			puts "#{@symbol} has three in a row. #{@player} has won!"
		elsif three_row == 2
			show_board
			puts "No more moves. It's a tie."
		else
			@turn += 1
			make_play
		end
	end
end

game = Tic_tac_toe.new