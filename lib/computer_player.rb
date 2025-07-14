class ComputerPlayer 
  attr_reader :code_length, :colours, :set_s
  def initialize(colours, code_length)
    @code_length = code_length
    @colours = colours
    @set_s = colours.repeated_permutation(@code_length).to_a
    @previous_guess = nil
    @previous_feedback = nil
  end
 
  def code_to_break(colours)
    @code = colours.sample(4)
  end

  def take_a_guess(colours)
    if @previous_guess == nil
      @previous_guess = colours[0], colours[0], colours[1], colours[1]
    else
      filter_possibilities
      @previous_guess = minmax_guess
    end
    @previous_guess
  end

  def sent_feedback(guess, feedback)
    @previous_guess = guess
    @previous_feedback = feedback
  end

  def filter_possibilities
    @set_s.select! do |possibilities|
     evaluate_guess(possibilities, @previous_guess) == @previous_feedback
    end
  end

  def evaluate_guess(guess, code)
    correct_positon = guess.each_with_index.count { |colour, idx| colour == code[idx]}
    colours_correct = common_elements(guess, code) - correct_positon
    [correct_positon, colours_correct]  
  end

  def common_elements(guess, code)
    freq1 = guess.tally
    freq2 = code.tally
    freq1.sum { |colour, count| [count, freq2[colour] || 0].min}
  end

  def minmax_guess
    #runs all the possibilites in set_s (the possible guesses)
    scores = @set_s.each_with_object({}) do |guess, score_map|
      feedback_counts = Hash.new(0)
      #compares the guess(possible guesses)one at a time with all the possible guesses(possibilities). So compares 1 guess from set_s with all the guesses from set_s but 1 at a time.
      #with each comparrison it evalutes_guess returning an array stored in feeback. 
      #the feeback variable is then used to count how many times the same feedback occurs.
      @set_s.each do |possibility| 
        feedback = evaluate_guess(possibility, guess)
        feedback_counts[feedback] += 1
      end
      puts "feeback counts: #{feedback_counts}"
      #this is where all the possible guesses are stripped away by choosing only the max feedback score which is the worst case(worst guess).
      #so the above variable scores is storing the worst choices and how many times they occured.
      worst_case = feedback_counts.values.max
      #the score_map uses teh guess for the key and assigns is worst case score to it. This is to then identify the guess with wit the score.
      score_map[guess] = worst_case
    end
    #this block chooses the lowest worst score. Or put another way...the best worst case.
    #it ignores the key and only iterates over the scores and chooses the lowest number.
    scores.min_by {|_, score| score }.first
  end

end

  