WIN_COMBINATIONS = [
  [0,1,2], #Top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,4,8], #Left diag
  [2,4,6], #right diag
  [0,3,6], #left column
  [1,4,7], #middle column
  [2,5,8] #right column
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(player_input)
  player_input.to_i - 1 #converts the number from string to integer and subtracts 1 for array input_to_index
end

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  if index.between?(0,8)
    if !position_taken?(board, index)
      true
    end
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, "X")
  else
    turn(board)
  end
end

def turn_count(board)
  board.count{|token| token == "X" || token == "O"}
end

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
