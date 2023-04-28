class Game
  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @current_player = @player1
  end

  def start
    puts " "
    puts "---- NEW GAME ----"
    while game_over? == false
      generate_question
      prompt_question
      answer = gets.chomp.to_i
      if answer == @answer
        puts "Correct!"
      else
        puts "Wrong answer! You lose a life."
        @current_player.lose_life
      end
      display_score
      new_turn
      switch_player
    end
    puts "#{@winner} wins with a score of #{@score}/3."
    puts " "
    puts "---- GAME OVER ----"
    puts "Good bye!"
  end

  def generate_question
    num1 = rand(1..20)
    num2 = rand(1..20)
    @answer = num1 + num2
    @question = "#{num1} + #{num2}"
  end

  def prompt_question
    puts "#{@current_player.name}: What is #{@question}?"
  end

  def switch_player
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end

  def game_over?
    if @player1.lives == 0 || @player2.lives == 0
      @score = [@player1.lives, @player2.lives].max
      @winner = @player1.lives == @score ? @player1.name : @player2.name
      return true
    else
      return false
    end
  end

  def display_score
    puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
  end 

  def new_turn
    puts " "
    puts "---- NEW TURN ----"
  end 
end