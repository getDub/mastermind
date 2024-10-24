class Game
  attr_accessor :code_maker, :code_breaker, :code, :code_to_break, :attempts, :guess
  
  def initialize(human_player_class)
    puts 'Hi player, please enter your name.'
    @code_breaker = human_player_class.new#(self)
    # puts @human_player_name = Player.new(self)
    puts @code_maker = ComputerPlayer.new#(self)
    @attempts = 0
  end
  
  def play_game
    welcome(@code_breaker)
    2.times do 
      @attempts += 1
      @code_breaker.players_guess
      feedback
      break if win?
    end
    exceeded_attempts?
  end
  
  def welcome(player)
    puts "Thanks #{player.name}, Welcome to Mastermind. \nCan you guess the 4 colours chosen by the codemaker? \nThere are 6 possible colours to choose from, (Red, Green, Blue, Pink, Yellow).  \nYou have 12 attempts to break the code.   \nThe Computer has generated a code for you to break.  \nPlease enter your first 4 guesses. No commas just a space between each colour."
    puts code_maker.code
  end
  
  def computer_generated_code
    code_maker.code
  end
  
  def exceeded_attempts?
    if @attempts == 2
      puts "Sorry but you have had 12 tries and were unable to break the code. The code maker is the Mastermind."
    end
  end

  def guess
    p @code_breaker.guess
  end

  def correct_position?
    code = computer_generated_code
    position = @code_breaker.guess.each_with_index.select do |colour, position|
      code[position].eql?(colour)
    end
    position.length
  end
  
  
  def colours_correct?
    code = computer_generated_code
    colours = @code_breaker.guess.each.select do|cols| 
      code.any?(cols)
    end
      colours.length
  end

  def feedback
    puts "Colours correct = #{colours_correct?}\nCorrect position = #{correct_position?}"
    if win?
      puts "You win"
    end
  end

  def win?
    colours_correct? == 2 && correct_position? == 2
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

# Game.new(HumanPlayer).play_game