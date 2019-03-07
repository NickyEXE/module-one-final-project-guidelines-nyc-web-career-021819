require_relative '../config/environment'

#welcomes the user
system "clear"
 puts "\e[H\e[2J"

def runner
  welcome
  ask_how_they_want_to_search
end
runner

sleep(1)
puts "leaving."
sleep(1)
puts "leaving..."
sleep(1)
puts "leaving....."
sleep(1)
puts "leaving......"
sleep(1)
puts "goodbye!"
sleep(2)
system "clear"
 puts "\e[H\e[2J"
