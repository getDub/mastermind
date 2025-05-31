class Game
  attr_accessor :code_maker, :code_breaker, :code, :code_to_break, :attempts, :guess
  
  COLOURS = ['red', 'green', 'blue', 'cyan', 'pink', 'yellow'].freeze
  CODE_LENGTH = 4
  MAX_ATTEMPTS = 5

  def initialize(human_player_class)
    puts 'Hi player, please enter your name.'
    @code_breaker = human_player_class.new#(self)
    # puts @human_player_name = Player.new(self)
    puts @code_maker = ComputerPlayer.new#(self)
    @attempts = 0
  end
  
  def play_game
    welcome(@code_breaker)
    while @attempts < MAX_ATTEMPTS do
      puts "\nCode break attempt #{@attempts += 1}"
      @code_breaker.players_guess
      feedback_on_guess
    end
  end
  
  def welcome(player)
    puts "Thanks #{player.name}, Welcome to Mastermind. \nCan you crack the Codmaker's code by guessing the 4 colours in the correct postion? \nThere are 6 possible colours to choose from, (Red, Green, Blue, Pink, Yellow).  \nYou have 12 attempts to break the code.   \nThe Computer has generated a code for you to break.\n    |--?--|--?--|--?--|--?--|  \nPlease enter your first 4 guesses. No commas just a space between each colour."
    puts code_maker.code #delete this line once done
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

  def valid_code?
    @code_breaker.guess.length == CODE_LENGTH && @code_breaker.guess.all? { |colour| COLOURS.include?(colour)}
  end

  def win?
    if colours_correct? == CODE_LENGTH && correct_position? == CODE_LENGTH then @attempts = MAX_ATTEMPTS + 1
    end
  end
  
  def feedback_on_guess
    if valid_code?
      puts "  Correct colour = #{colours_correct?}\n  Correct colour and position = #{correct_position?}"
    else
      puts "\n !!Your code doesn't look right.\n Check you have #{CODE_LENGTH} colours and they are spelled correctly."
      @attempts -= 1
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
      puts " Please have another guess."
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