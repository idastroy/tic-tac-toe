module Board
  @@top_row = ["_", " | ", "_", " | ", "_", "     ", "1", " | ", "2", " | ", "3"] 
  @@middle_row = ["_", " | ", "_", " | ", "_", "     ", "4", " | ", "5", " | ", "6"]
  @@bottom_row = ["_", " | ", "_", " | ", "_", "     ", "7", " | ", "8", " | ", "9"]
  @@options = [1, 2, 3, 
               4, 5, 6, 
               7, 8, 9]

  def make_grid
    puts " ", @@top_row.join, @@middle_row.join, @@bottom_row.join, " "
  end
  
end

class Game
  include Board

  @@round = 0
  @@symbols = ["X", "O"]
  @@player = 0
  @@player1_turn = true

  def initialize
    puts "Enter the first player's name."
    @player1 = gets.chomp
    puts " ", "Hello #{@player1}, you are #{@@symbols[@@player]}", " "
    @@player += 1

    puts "Enter the second player's name."
    @player2 = gets.chomp
    puts " ", "Hello #{@player2}, you are #{@@symbols[@@player]}", " "
  end

  def play
    while @@round < 9
      
      make_grid
      if @@player1_turn
        puts " ", "It's #{@player1}'s turn. Type one of the following options: #{@@options.join", "}"
        @@player1_turn = false
        @@player -= 1
      else
        puts " ", "It's #{@player2}'s turn. Type one of the following options: #{@@options.join", "}"
        @@player1_turn = true
        @@player += 1
      end
      
      @player_selection = gets.chomp.to_i
      if !@@options.include?(@player_selection)
        puts "Oops, that's not an option. Try again!"
        @player_selection = gets.chomp.to_i
      else 
        puts "You picked #{@player_selection}"
        @@options.delete(@player_selection)
        @@round += 1 
      end 
      

      ##Change grid when player selects 1-9
      if @player_selection == 1
        @@top_row[0] = @@symbols[@@player]
      end

      if @player_selection == 2
        @@top_row[2] = @@symbols[@@player]
      end

      if @player_selection == 3
        @@top_row[4] = @@symbols[@@player]
      end

      if @player_selection == 4
        @@middle_row[0] = @@symbols[@@player]
      end

      if @player_selection == 5
        @@middle_row[2] = @@symbols[@@player]
      end

      if @player_selection == 6
        @@middle_row[4] = @@symbols[@@player]
      end

      if @player_selection == 7
        @@bottom_row[0] = @@symbols[@@player]
      end

      if @player_selection == 8
        @@bottom_row[2] = @@symbols[@@player]
      end

      if @player_selection == 9
        @@bottom_row[4] = @@symbols[@@player]
      end

      ##Declare winner for horizontal

      if @@top_row[0] == "X" && @@top_row[2] == "X" && @@top_row[4] == "X"
        make_grid
        puts "#{@player1} wins!"
        break
      end

      if @@top_row[0] == "O" && @@top_row[2] == "O" && @@top_row[4] == "O"
        make_grid
        puts "#{@player2} wins!"
        break
      end

      if @@middle_row[0] == "X" && @@middle_row[2] == "X" && @@middle_row[4] == "X"
        make_grid
        puts "#{@player1} wins!"
        break
      end

      if @@middle_row[0] == "O" && @@middle_row[2] == "O" && @@middle_row[4] == "O"
        make_grid
        puts "#{@player2} wins!"
        break
      end

      if @@bottom_row[0] == "X" && @@bottom_row[2] == "X" && @@bottom_row[4] == "X"
        make_grid
        puts "#{@player1} wins!"
        break
      end

      if @@bottom_row[0] == "O" && @@bottom_row[2] == "O" && @@bottom_row[4] == "O"
        make_grid
        puts "#{@player2} wins!"
        break
      end

      ##Declare winner for vertical

      if @@top_row[0] == "X" && @@middle_row[0] == "X" && @@bottom_row[0] == "X"
        make_grid
        puts "#{@player1} wins!"
        break
      end

      if @@top_row[0] == "O" && @@middle_row[0] == "O" && @@bottom_row[0] == "O"
        make_grid
        puts "#{@player2} wins!"
        break
      end

      if @@top_row[2] == "X" && @@middle_row[2] == "X" && @@bottom_row[2] == "X"
        make_grid
        puts "#{@player1} wins!"
        break
      end

      if @@top_row[2] == "O" && @@middle_row[2] == "O" && @@bottom_row[2] == "O"
        make_grid
        puts "#{@player2} wins!"
        break
      end

      if @@top_row[4] == "X" && @@middle_row[4] == "X" && @@bottom_row[4] == "X"
        make_grid
        puts "#{@player1} wins!"
        break
      end

      if @@top_row[4] == "O" && @@middle_row[4] == "O" && @@bottom_row[4] == "O"
        make_grid
        puts "#{@player2} wins!"
        break
      end

      ##Declare winner for diagonal

      if @@top_row[0] == "X" && @@middle_row[2] == "X" && @@bottom_row[4] == "X"
        make_grid
        puts "#{@player1} wins!"
        break
      end

      if @@top_row[0] == "O" && @@middle_row[2] == "O" && @@bottom_row[4] == "O"
        make_grid
        puts "#{@player2} wins!"
        break
      end

      if @@top_row[4] == "X" && @@middle_row[2] == "X" && @@bottom_row[0] == "X"
        make_grid
        puts "#{@player1} wins!"
        break
      end

      if @@top_row[4] == "O" && @@middle_row[2] == "O" && @@bottom_row[0] == "O"
        make_grid
        puts "#{@player2} wins!"
        break
      end


    end 

      ##Declare a tie

      if @@round == 9
        make_grid
        puts "It's a tie!"
      end

    
  end


end


test = Game.new
test.play


  