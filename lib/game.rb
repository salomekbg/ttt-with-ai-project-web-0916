require_relative './players/human.rb'

class Game
	attr_accessor :board, :cells, :player_1, :player_2

	WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [6,4,2]
	]

	def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
		@player_1 = player_1
		@player_2 = player_2
		@board = board
		@winner = ""
	end

	def current_player
		board.turn_count % 2 == 0 ? player_1 : player_2
		#at the end of an even turn, it will be player_1's turn
	end

	def over?
		board.full?
	end

	def won?
		won = ""
		WIN_COMBINATIONS.each do |winning_array|
			if board.cells[winning_array[0]] == "X" && board.cells[winning_array[1]] == "X" && board.cells[winning_array[2]] == "X"
				won = true
				@winner = "X"
				break
			elsif board.cells[winning_array[0]] == "O" && board.cells[winning_array[1]] == "O" && board.cells[winning_array[2]] == "O"
				won = true
				@winner = "O"
				break
			else
				won = false
			end
		end
		won
	end

	def draw?
		won? == false && over?
	end

	def winner
		@winner if won?
	end

	def play
		until won? || draw?
			turn
		end

		@end_play = ""

		if won?
			board.display
			puts ""
			play = "Congratulations #{winner}!"
			puts @end_play
		elsif draw?
			play = "Cats Game!"
			puts @end_play
		end
	end

	def turn
		current_move = current_player.move(board)
		while board.valid_move?(current_move) == false
			current_move = current_player.move(board)
		end

		board.update(current_move, current_player)
	end
end