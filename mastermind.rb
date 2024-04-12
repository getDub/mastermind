#Colour selection
#Feedback on selection - dots - winner
#Human code selector
#Computer guesser

#Codemaker
module Mastermind
  COLOURS = ['Red', 'Green', 'Blue', 'Cyan', 'Magenta', 'Yellow']
  
  
  
#Rules intro
  
  class GAME
    
    @@peg_positions = [[1, 2, 3, 4]]
    
    def initialize(human_player_class)
      @intro = intro
    end
    
    def intro
      
    end

    def print_board
      front_spacer, col_separator, row_separator = '   ', '   |   ', '-------+-------+-------+-------'
      @@peg_positions.each do |positions|
        puts positions.join(col_separator).insert(0, front_spacer)
        puts row
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