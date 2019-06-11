module MathGame
  class Question
    def new_question (currentPlayer)
      r = Random.new
      first_number = r.rand(0...20)
      second_number = r.rand(0...20)
      puts "#{currentPlayer.player}: What does #{first_number} plus #{second_number} equals ?"
      input = nil
      input_number = Thread.new do
        input = gets.chomp
      end
      countdown = Thread.new do
        3.downto(0) do |i|
          puts "\r00:00:#{'%02d' % i}"
          sleep 1
          break if input
        end
      end
      input_number.join(5)
      countdown.join
      if input.to_i == first_number + second_number
        puts "#{currentPlayer.player}: Yes! You are right! "
      else
        puts "#{currentPlayer.player}: Seriously ? No!"
        currentPlayer.lives -= 1
      end
    end
  end
end