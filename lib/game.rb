class Game
  attr_accessor :computer, :human, :code, :code_to_break, :attempts, :guess, :colours, :test
  
  COLOURS = ['red', 'green', 'blue', 'cyan', 'pink', 'yellow'].freeze
  CODE_LENGTH = 4
  MAX_ATTEMPTS = 5

  def initialize(human_player_class)
    # puts @human_player_name = Player.new(self)
    puts 'Hi player, please enter your name.'
    puts @human = human_player_class.new#(self)
    puts @computer = ComputerPlayer.new(COLOURS, CODE_LENGTH)#(self)
    @attempts = 0
    @guess = nil
    @code = nil
    @feedback
  end
  
  def start
    welcome
    game_setup
    play_game
  end

# Press 1 = Code maker = code
# Press 2 = Code breaker = guess

  def welcome
    puts "Thanks #{human.name}, would you like to be the Code maker (press 1) or the Code Breaker (press 2)"
    human.code_breaker_or_maker?
  end

  def game_setup
    if human.choice == 1
      puts "#{human.name} you have chosen to be the Code maker.\n There are 6 colours to choose from, (Red, Green, Blue, Pink, Yellow).  \n Choose only 4 colours to make your code. No commas just a space between each colour."
      # @computer.set_s(CODE_LENGTH)
      loop do
        input = human.make_code
          if valid_code?(input)
            puts "Code looks good to me"
            @code = input
            # puts "valid? = @code = #{@code} and human code = #{@human.code}"
            break
          else
            puts "That code aint right"
            @code = nil
            
          end
            keep_guessing
          end
    else #human.choice == 2
      puts "Thanks #{human.name}, Welcome to Mastermind. \nCan you crack the Codmaker's code by guessing the 4 colours in the correct postion? \nThere are 6 possible colours to choose from, (Red, Green, Blue, Pink, Yellow).  \nYou have 12 attempts to break the code.   \nThe Computer has generated a code for you to break.\n    |--?--|--?--|--?--|--?--|  \nPlease enter your first 4 guesses. No commas just a space between each colour."
      puts @code = @computer.code_to_break(COLOURS) #don't print to screen once finished.
    end
  end

  def play_game
  # def start
    # welcome
    # game_setup
    while @attempts < MAX_ATTEMPTS do
      #end
      puts "\n--- Code break attempt #{@attempts += 1} ---"
      if human.choice == 1? @guess = @computer.take_a_guess(COLOURS) : @guess = @human.players_guess
      # if human.choice == 1? @guess = @computer.take_a_guess(COLOURS) : @guess = @human.players_guess
        feedback_on_guess

        # @human.players_guess
      end
    end
  end

  def computer_generated_code
    computer.code
  end
  
  def keep_guessing
    puts "please have another guess"
  end

  def correct_position?
    @guess.each_with_index.count {|colour, idx| colour == @code[idx] }
  end
  
  def colours_correct?
    common_elements(@guess, @code)
  end
   
  #thanks to Naelson.exe for this bit of code.
  def common_elements(guess, code)
    tally1 = guess.tally
    tally2 = code.tally
    tally1.sum { | colour, count| [count, tally2[colour] || 0].min }
  end

  def valid_code?(guess_or_code)
    guess_or_code.length == CODE_LENGTH && guess_or_code.all? { |colour| COLOURS.include?(colour)}
  end

  def win?
    if colours_correct? == CODE_LENGTH && correct_position? == CODE_LENGTH then @attempts = MAX_ATTEMPTS + 1
    end
  end
  
  def feedback_on_guess
    if valid_code?(@guess)
      puts "The guess = #{@guess}"
      puts "  Correct colour and position = #{correct_position?}\n  Correct colour wrong place = #{colours_correct? - correct_position?}"
      @feedback = [correct_position?, colours_correct? - correct_position?]
      puts "feedback = #{@feedback}"#delete once finished
      @computer.sent_feedback(@feedback)
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
    end
  end

end
