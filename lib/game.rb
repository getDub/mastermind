class Game
  attr_accessor :computer, :human, :code, :code_to_break, :attempts, :guess, :colours
  
  COLOURS = ['red', 'green', 'blue', 'cyan', 'pink', 'yellow'].freeze
  CODE_LENGTH = 4
  MAX_ATTEMPTS = 5

  def initialize(human_player_class)
    # puts @human_player_name = Player.new(self)
    puts 'Hi player, please enter your name.'
    puts @human = human_player_class.new#(self)
    puts @computer = ComputerPlayer.new#(self)
    @attempts = 0
  end
  
  def play_game
    welcome
    game_setup
    while @attempts < MAX_ATTEMPTS do
      puts "\n--- Code break attempt #{@attempts += 1} ---"
      @human.players_guess
      feedback_on_guess
    end
  end
  
  def welcome
    # puts "Thanks #{player.name}, Welcome to Mastermind. \nCan you crack the Codmaker's code by guessing the 4 colours in the correct postion? \nThere are 6 possible colours to choose from, (Red, Green, Blue, Pink, Yellow).  \nYou have 12 attempts to break the code.   \nThe Computer has generated a code for you to break.\n    |--?--|--?--|--?--|--?--|  \nPlease enter your first 4 guesses. No commas just a space between each colour."
    puts "Thanks #{human.name}, would you like to be the Code maker (press 1) or the Code Breaker (press 2)"
    puts computer.code #delete this line once done
    human.code_breaker_or_maker?
  end

  def game_setup
    if human.choice == 1
      puts "#{human.name} you have chosen to be the Code maker.\n There are 6 colours to choose from, (Red, Green, Blue, Pink, Yellow).  \n Choose only 4 colours to make your code. No commas just a space between each colour."
      loop do
        human.make_code
          if valid_code?(@human.code)
            puts "Code looks good to me"
            break
          else
            puts "That code aint right"
          end
            keep_guessing
        end
      else human.choice == 2
        puts @computer.code_to_break(COLOURS) #don't print to screen once finished.
        puts "Thanks #{human.name}, Welcome to Mastermind. \nCan you crack the Codmaker's code by guessing the 4 colours in the correct postion? \nThere are 6 possible colours to choose from, (Red, Green, Blue, Pink, Yellow).  \nYou have 12 attempts to break the code.   \nThe Computer has generated a code for you to break.\n    |--?--|--?--|--?--|--?--|  \nPlease enter your first 4 guesses. No commas just a space between each colour."
    end
  end

#   if valid_code?(@human.code)
#     puts "Code looks good to me"
#   else
#   end
#     keep_guessing
# end
  
  def computer_generated_code
    computer.code
  end
  
  def keep_guessing
    puts "please have another guess"
  end

  def correct_position?
    code = computer_generated_code
    position = @human.guess.each_with_index.select do |colour, position|
      code[position].eql?(colour)
    end
    position.length
  end
  
  def colours_correct?
    code = computer_generated_code
    colours = @human.guess.each.select do|cols| 
      code.any?(cols)
    end
      colours.length
  end

  # def valid_code?
  #   @human.guess.length == CODE_LENGTH && @human.guess.all? { |colour| COLOURS.include?(colour)}
  # end
   
  def valid_code?(guess_or_code)
    guess_or_code.length == CODE_LENGTH && guess_or_code.all? { |colour| COLOURS.include?(colour)}
  end

  def win?
    if colours_correct? == CODE_LENGTH && correct_position? == CODE_LENGTH then @attempts = MAX_ATTEMPTS + 1
    end
  end
  
  
  def feedback_on_guess
    if valid_code?(@human.guess)
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
    else keep_guessing
      # puts " Please have another guess."
    end
  end

  def code_maker_code_correct?
    if valid_code?(@human.code)
      puts "Code looks good to me"
    else
      puts "That code aint right"
    end
      keep_guessing
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