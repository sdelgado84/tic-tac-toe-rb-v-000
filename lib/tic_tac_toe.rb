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
# move
def move(index, char="X")
    @board[index] = char
    turn_count
    display_board
  end
  #position_taken
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end
  # valid_move
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  #Def_Turn
  def turn
    puts "Please enter 1-9:"
    i = gets.strip
    index = input_to_index(i)
    m = valid_move?(index)
    if m == true
      move(index, current_player)
    else m == false
      until m == true
        puts "Sorry, that was an invalid move. Please enter 1-9:"
        display_board
        i = gets.strip
        index = input_to_index(i)
        m = valid_move?(index)
        move(index, current_player)
      end
    end
  end
#Def turn_count
def turn_count
    count = 0
    @board.each do |move|
      if move == "X" || move == "O"
        count += 1
      end
    end
    count
  end
  def current_player
      turn_count.even? ? "X" : "O"
    end

    def won?
      WIN_COMBINATIONS.find do |win_combo|
        @board[win_combo[0]] == @board[win_combo[1]] && @board[win_combo[0]] == @board[win_combo[2]] && position_taken?(win_combo[1])
      end
    end

    def full?
      @board.none? do |i|
        i == " " || i.nil?
      end
    end

    def draw?
      won? == nil && full? == true
    end

    def over?
      draw? == true || won? != nil
    end

    def winner
      if won? != nil
        winner = @board[won?[0]]
      end
    end

    def play
      until over? == true
        turn
      end
      if draw? == true
           puts "Cat's Game!"
      else won?
         puts "Congratulations #{winner}!"
       end
    end

  end
