print %q"Welcome to BATTLESHIP
Enter p to play. Enter q to quit.
>>>"

play_or_quit = gets.chomp

if play_or_quit == "p"
  play_game
elsif play_or_quit == "q"
  print "Thanks for all the fish! Hope to see you again. Bye!"
else print "Bye!"
end

def play_game
  new_game.Battle.new
end
