#Colour selection
#Feedback on selection - dots - winner
#Human code selector
#Computer guesser

#Codemaker
module Mastermind
  COLOURS = ['Red', 'Green', 'Blue', 'Cyan', 'Pink', 'Yellow']
  
  
  
#Rules intro
  
  class GAME
    
    @@peg_positions = [[1, 2, 3, 4]]
    @@colours = [['Red', 'Grn', 'Blu']]

    attr_accessor :name

    def initialize(human_player_class)
      @intro = intro
      @name = name
    end

    def name
      @name
    end
    
    def get_name
      puts 'Hi player, please enter your name.'
      player_name = gets
    end

    def intro
      puts "Thanks #{name}, Welcome to Mastermind.
      Can you guess the 4 colours chosen by the codemaker? 
      There are 6 possible colours to choose from, (Red, Green, Blue, Pink, Yellow).
      You have 12 attempts to break the code.
      Please enter your first 4 guesses."
    end

    def feedback

    end

    def print_board
      front_spacer, short_col_separator, col_separator, row_separator = '   ', ' | ', '   |   ', '-------+-------+-------+-------'
      
      @@colours.each do |col|
      puts col.join(short_col_separator).insert(0, front_spacer)
      puts row_separator
      end

      @@peg_positions.each do |positions|
        puts positions.join(col_separator).insert(0, front_spacer)
      end
    end
    
    
  end

  class Player
    
  end

  class HumanPlayer
    
  end
  
  class ComputerPlayer
    
    def random_code_maker(arr)
      code = []
      4.times do 
        code << arr[Random.rand(0..5)]
      end
      p code
    end
  
    random_code_maker(colored_pegs)
  end
  
end

include Mastermind