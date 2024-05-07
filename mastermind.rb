module Mastermind
  COLOURS = ['Red', 'Green', 'Blue', 'Cyan', 'Pink', 'Yellow'].freeze
  POSITIONS = [[1, 2, 3, 4]]
  
  class Game
    
    attr_accessor :codebreaker, :code, :code_to_break
    
    def initialize(human_player_class)
      @code_breaker = human_player_class.new(self)
      @code_maker = ComputerPlayer.new(self)
      @guesses = []
      # @code_to_break = []
    end
    

    def play_game
      intro(@code_breaker)
      correct_color_and_position?
    end
    
    def intro(player)
      name = player.get_name
      puts "Thanks #{name}, Welcome to Mastermind.
      Can you guess the 4 colours chosen by the codemaker?
      There are 6 possible colours to choose from, (Red, Green, Blue, Pink, Yellow).
      You have 12 attempts to break the code."
    end

    def computer_generated_code(computer_code)
      computer_code.auto_code_maker
    end
    
    def correct_color_and_position?
      code = computer_generated_code(@code_maker)
      guess = @code_breaker.players_guess
      guess.each_with_index do |colour, position|
        p code[position].include?(colour)
        # p correct_combo
      end
    end

    def any_colours_in_the_code?
      @guesses.each {|cols| p code_to_break(cols)}
    end
    
    # def players_guess
    #   puts "Please enter your first 4 guesses. No commas just a space between each colour."
    #   player_input = gets.chomp.split
    # end
    

    def has_won?
      if @guesses == COLOURS
        p 'You won!'
      else
        p 'No luck, try again'
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

    def initialize(game)
      @game = game
    end
  end

  class HumanPlayer < Player
      
    def get_name
      puts 'Hi player, please enter your name.'
      name = gets.chomp
      name
    end
    
    def players_guess
      puts "Please enter your first 4 guesses. No commas just a space between each colour."
      player_input = gets.chomp.split
    end

  end
  
  class ComputerPlayer < Player

    def random_nums
      rando_nums = [] 
      POSITIONS.flatten.each do |positions| 
        positions = rand(0..5)
        rando_nums << positions
      end
      rando_nums
    end
    
    def auto_code_maker
      code_to_break = []
      random_nums.each {|positions| code_to_break << COLOURS[positions]}
      puts "The Computer has generated a code for you to try and guess...may the force be with you."
      p code_to_break
    end
  end

  
  
end

include Mastermind

Game.new(HumanPlayer).play_game