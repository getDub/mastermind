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
    while @attempts < 5 do
      puts "Code break attempt #{@attempts += 1}"
      @code_breaker.players_guess
      feedback_on_guess
    end
  end
  
  def welcome(player)
    puts "Thanks #{player.name}, Welcome to Mastermind. \nCan you crack the Codmaker's code by guessing the 4 colours in the correct postion? \nThere are 6 possible colours to choose from, (Red, Green, Blue, Pink, Yellow).  \nYou have 12 attempts to break the code.   \nThe Computer has generated a code for you to break.\n    |--?--|--?--|--?--|--?--|  \nPlease enter your first 4 guesses. No commas just a space between each colour."
    puts code_maker.code
  end
  
  def computer_generated_code
    code_maker.code
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

    def valid_colour?
      # puts "#{@code_maker.colours}"
    incorrect_colours = @code_breaker.guess.each_with_index.select do |colour, position|
      @code_maker.colours[position].eql?(colour)
       end
    puts incorrect_colours
    end

  def win?
    if colours_correct? == 4 && correct_position? == 4 then @attempts = 6
    end
  end
  
  def four_colours?
    @code_breaker.guess.length == 4
  end


  def feedback_on_guess
    if four_colours?
      puts "  Colours correct = #{colours_correct?}\n  Correct position = #{correct_position?}"
    elsif @code_breaker.guess.length < 4
      puts "I don't think you chose 4 colours"
      @attempts -= 1
    else
      valid_colour?
    end
    win_or_loose?
  end

  def guess_limit_reached?
    @attempts == 5
  end

  def win_or_loose?
    if guess_limit_reached?
      puts "YOU LOOSE.\nYou've had 12 guesses and haven't broken the code."
    elsif win?
      puts "YOU WIN BUDDY!"
    else
      puts "Please have another guess."
    end
  end

  # def print_board
  #   front_spacer, short_col_separator, col_separator, row_separator = '   ', ' | ', '   |   ', '-------+-------+-------+-------'
    
  #   @@colours.each do |col|
  #   puts col.join(short_col_separator).insert(0, front_spacer)
  #   puts row_separator
  #   end

  #   @@peg_positions.each do |positions|
  #     puts positions.join(col_separator).insert(0, front_spacer)
  #   end
  # end
end

# Game.new(HumanPlayer).play_game