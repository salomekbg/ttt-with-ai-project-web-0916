require_relative '../player.rb'

module Players
	class Computer < Player
		def move(board)
			# "1"
			board.display
			puts ""
			puts ""
			#check if you have to block the human then do
			[4, 0, 2, 6, 8, 1, 3, 5, 7].each do |index|
				if board.cells[index] == " "
					return "#{index + 1}"
				end
			end
			#http://www.markphelps.me/2015/04/06/unbeatable-tic-tac-toe-in-ruby-3.html
		end

		# def try_middle
		# 	board.cells[4] == " "
		# 		"4"
		# 	else
		# 		false
		# 	end
		# end

		# def try_corners
		# 	[[0], [2], [6], [8]].each do |index|
		# 		if board.cells[index] == " "
		# 			"#{index + 1}"
		# 		end
		# 	end
		# end

		# def try_sides
		# 	[[1], [3], [5], [7]].each do |index|
		# 		if board.cells[index] == " "
		# 			"#{index + 1}"
		# 		end
		# 	end
		# end
	end
end