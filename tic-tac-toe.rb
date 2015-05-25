# require 'pry'
require "./board.rb"
require "./player.rb"

class Tic_tac_toe
	#show the board, initialize two players
	attr_reader :x_player, :o_player

	#Initialize the game
	def initialize
		@x_player = Player.new("Player 1", "X")
		@o_player = Player.new("Player 2", "O")
		start_game
	end

	def start_game
		puts "Welcome to Tic-Tac-Toe!"
		x_player.my_turn = true
		show_board
	end

	def whose_turn?
		until over?
		current_player = x_player.my_turn ? x_player : o_player
		current_player.make_move
		switch_players
	end

	def switch_players
		if x_player.my_turn
			x_player.my_turn = false
			o_player.my_turn = true
		else
			x_player.my_turn = true
			o_player.my_turn = false
		end
	end
end