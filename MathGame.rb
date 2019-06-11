require "./player.rb"
require "./turn.rb"
require "./question.rb"

module MathGame
  class Game
    def initialize
      @person1 = Player.new("player1")
      @person2 = Player.new("player2")
      @player_array = [@person1, @person2].cycle
      puts"-------------------------------"
      puts"-- Welcome to the MathGame ! --"
      puts"-------------------------------"
       while @person1.lives > 0 && @person2.lives > 0 do
          @this_player = @player_array.next

          question = Question.new
          question.new_question(@this_player)
          
          turn = Turn.new
          turn.new_turn

          puts "p1: #{@person1.lives}/3 vs p2: #{@person2.lives}/3"

          game_state = @person1.lives > 0 && @person2.lives > 0
        end
      # else
        if @person1.lives == 0
          puts "Player 2 wins with a score of #{@person2.lives}/3"
        else
          puts "Player 1 wins with a score of #{@person1.lives}/3"
        end
        puts "---------- GAME OVER ----------", "Good Bye !"
      # end
    end
  end
end