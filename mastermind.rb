#Colour selection
#Feedback on selection - dots - winner
#Human code selector
#Computer guesser

#Codemaker
module Mastermind
  COLOURS = ['Red', 'Green', 'Blue', 'Cyan', 'Pink', 'Yellow']
  
  
  
#Rules intro
  
  class Game
    
    @@peg_positions = [[1, 2, 3, 4]]
    #@@colours = [['Red', 'Green', 'Blue', 'Pink', 'Yellow']]

    attr_accessor :codebreaker
    attr_writer :num_of_attempts

    def initialize(human_player_class)
      @get_name = get_name
      @codebreaker = human_player_class.new
      @intro = intro
      #@name = name
    end
    
    @guesses = []

    def play_game
      12
    end
    
    def get_name
      puts 'Hi player, please enter your name.'
    end

    def intro
      puts "Thanks #{self.codebreaker.name}, Welcome to Mastermind.
      Can you guess the 4 colours chosen by the codemaker?
      There are 6 possible colours to choose from, (Red, Green, Blue, Pink, Yellow).
      You have 12 attempts to break the code.
      Please enter your first 4 guesses. no commas just a space between each colour."
      self.guess
    end

    def guess
      player_input = gets.chomp
      @guesses = player_input.split
      # p @guesses
    end

    def compare_code
      @guesses ==       
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
    attr_accessor :name

    def initialize
      @name = gets.chomp
    end
  end

  class HumanPlayer < Player
    
  end
  
  class ComputerPlayer
    attr_accessor :random_code_maker
    attr_reader :code
    def initialize
      @random_code_maker = random_code_maker(COLOURS)
    end
    
    @code = []

    def random_code_maker(arr)
      code = []
      4.times do 
        @code << arr[Random.rand(0..5)]
      end
      p '? | ? | ? | ?'
      p @code
    end
  
  end
  
end

include Mastermind

Game.new(HumanPlayer)