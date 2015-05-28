class Tic_tac_toe
	#Initialize the game, board and two players
	attr_reader :board, :current_player

	def initialize player1, player2
		@board = Array.new(9,"-")
		@x = player1
		@o = player2
		@turn = 1
		puts "Welcome to Tic-Tac-Toe!"
		take_turn
	end

	def symbol
		current_player == @x ? @o : @x
	end

	def show_board
		puts "|#{@board[0]}|#{@board[1]}|#{@board[2]}|"
		puts "|-|-|-|"
		puts "|#{@board[3]}|#{@board[4]}|#{@board[5]}|"
		puts "|-|-|-|"
		puts "|#{@board[6]}|#{@board[7]}|#{@board[8]}|"
	end

	def take_turn
		show_board
		puts "Player #{@symbol} it is your turn. Make your move by typing in the number of the square in which you want to play."
		move = gets.chomp.to_i
		check_board move
	end

	def check_board move
		if (0..8).include?(move)
			if @board[move] == "---"
				make_play(move)
			else
				puts "Whoa there! Looks like someone's already there. Try choosing another spot."
				take_turn
			end
		else
			puts "Oops! Looks like that's not a valid entry. Try again with a number from 0-8."
			take_turn
		end
	end

	def make_play move
		@board[move] = symbol

		if @current_player == @x
			@current_player = @o
		else
			@current_player = @x
		end
	end

	def win_combos
	# Possible wins
	[
		[0,1,2],
		[3,4,5],
		[6,7,8],
		[0,3,6],
		[1,4,7],
		[2,5,8],
		[0,4,8],
		[2,4,6]
	]
	end

	def three_row?
		win_combos.each do |tic|
			tac_count = 0
			tic.each do |move|
				if win_combos.include?(move)
					tac_count += 1
				end
			end
			win = 1 if tac_count == 3
		end

		if win == 1
			return 1
		else
			return 2
		end
	end

	def over?
		#determine when the game is over
		if three_row? == 1
			show_board
			puts "Tic-Tac-Toe! We have a winner."
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