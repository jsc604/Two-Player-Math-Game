class Game
  attr_accessor :player1, :player2, :current_player
   
  def initialize(name1, name2)
    @player1 = Player.new(name1)
    @player2 = Player.new(name2)
    @current_player = @player1
  end

  def switch_turns
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end

  def start
    until @player1.lives == 0 || @player2.lives == 0
      question = Questions.new
      puts "----- NEW TURN -----"
      puts "#{@current_player.name}: What does #{question.num1} + #{question.num2} equal?"
      print "> "
      input = gets.chomp.to_i

      if input === question.answer
        puts "YES! You are correct."
      else
        puts "NO! You are incorrect"
        @current_player.lives -= 1
      end

      puts "#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"
      switch_turns
    end

    if @player1.lives == 0
      puts "----- GAME OVER -----"
      puts "#{@player2.name} wins with a score of #{@player2.lives}/#{@player1.lives}"
    elsif @player2.lives == 0
      puts "----- GAME OVER -----"
      puts "#{@player1.name} wins with a score of #{@player1.lives}/#{@player2.lives}"
    end
  end

end