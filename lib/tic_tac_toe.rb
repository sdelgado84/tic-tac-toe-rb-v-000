WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]]
#Output board
def display_board(board = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
  puts 'display board'
# Output board
puts " #{board[0]} | #{board[1]} | #{board[2]} "
puts "-----------"
puts " #{board[3]} | #{board[4]} | #{board[5]} "
puts "-----------"
puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
# Input to Index 
def input_to_index(move)
   index = move.to_i - 1
   index
end