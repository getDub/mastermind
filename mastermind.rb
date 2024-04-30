#Colour selection
#Feedback on selection - dots - winner
#Human code selector
#Computer guesser

#Codemaker
module Mastermind
  COLOURS = ['Red', 'Green', 'Blue', 'Cyan', 'Pink', 'Yellow'].freeze
  POSITIONS = [[1, 2, 3, 4]]
  
  
  
#Rules intro
  
  class Game
    
    attr_accessor :codebreaker, :code, :code_to_break
    
    def initialize(human_player_class)
      @get_name = get_name
      @codebreaker = human_player_class.new
      @intro = intro
      @guesses = []
      @code = Array.new
      @code_to_break = []
      # @codemaker = ComputerPlayer.new
    end
    

    def play_game
      random_code
      colours(random_nums)
      get_player_guess
      # correct_color_and_position?
      # has_won?
    end
    
    def get_name
      puts 'Hi player, please enter your name.'
    end
    
    def intro
      puts "Thanks #{@codebreaker.name}, Welcome to Mastermind.
      Can you guess the 4 colours chosen by the codemaker?
      There are 6 possible colours to choose from, (Red, Green, Blue, Pink, Yellow).
      You have 12 attempts to break the code.
      Please enter your first 4 guesses. no commas just a space between each colour."
    end
    
    def random_nums
      POSITIONS.flatten.each do |i| 
        i = rand(0..5)
        code << i
      end
      p code
    end

    def colours(nums)
      nums.each {|col| p code_to_break << COLOURS[col]}
    end

    # def can_it?
    #   p code_to_break
    # end

    def get_player_guess
      player_input = gets.chomp
      @guesses = player_input.split
      p @guesses
    end
    

    def has_won?
      if @guesses == COLOURS
        p 'You won!'
      else
        p 'No luck, try again'
      end
    end

    def correct_color_and_position?
      correct_combo = []
      (1..4).each do |posi|
        correct_combo << if @guesses[posi] == random_code[posi]
        p correct_combo
      end
    end
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
      @name = "Zeus" #gets.chomp
    end
  end

  class HumanPlayer < Player
    
  end
  
  class ComputerPlayer
    attr_accessor :random_code_maker
    # attr_reader :code
    @@code = []

    def initialize
      @random_code_maker = random_code_maker(COLOURS)
    end
    

    # def random_code_maker(arr)
    #   # code = []
    #   4.times do 
    #     @@code << arr[Random.rand(0..5)]
    #   end
    #   puts '    ?    |    ?    |    ?    |    ?'
    #   p @@code
    # end
  
  end
  
end

include Mastermind

Game.new(HumanPlayer).play_game