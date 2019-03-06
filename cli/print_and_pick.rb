def printer(hash_array,iterator)
  if hash_array.length <= iterator + 4
    last_print = hash_array.length
  else
    last_print = iterator+4
  end
  if iterator > hash_array.length-4
    puts "No more karaoke places available.
    Please choose from the available options."
  else
    i = iterator
    hash_array[iterator..last_print].each do |business|
      i +=1
      puts "#{i}. #{business['name']}"
      business["location"]["display_address"].each do |address_line|
        puts address_line
      end
      puts "**********************
      "
    end
    puts "
    Do any of these sound good?
    If so, pick it by number. If you want to
    see more, type 'MORE'. If you want to
    choose a different location,  type
    'NEW LOCATION'."
  end
  iterator
end

def karaoke_pick_inputter(hash_array,iterator)
  input = gets.chomp()
  if !valid?(hash_array,iterator)
    puts "Invalid!"
  elsif input.downcase == "more"
    printer(hash_array,iterator+5)
    karaoke_pick_inputter(hash_array,iterator+5)
  elsif input.to_i > 0 && input.to_i < hash_array.length + 1
    karaoke_place = picker(hash_array,input.to_i-1)
    karaoke_place_welcome(karaoke_place)
  else
    puts "Invalid input."
    karaoke_pick_inputter(hash_array,iterator)
  end
end

def valid?(hash_array,iterator)
  if hash_array == nil || hash_array == []
    puts "There are no karaoke places near that location."
    false
  elsif iterator > hash_array.length
    if iterator > 0
      puts "There are no more karaoke places near that location."
    else
      puts "There are no karaoke places near that location."
    end
    false
  else
    true
  end
end


#
# def print_and_pick(hash_array, iterator)
#   if valid?(hash_array, iterator)
#     print_ten(hash_array, iterator)
#     input = gets.chomp()
#     cleaned_input = input_interpreter(hash_array,input,iterator)
#     if cleaned_input.class == Fixnum
#       picker(hash_array,cleaned_input)
#     else
#
#     end
#   else
#     start_again
#   end
# end

# def input_interpreter(hash_array, input, iterator)
#   if input.to_i > 0 && input.to_i < (hash_array.length+1)
#     input.to_i-1
#   elsif input.downcase == "more"
#     print_and_pick(hash_array, iterator+10)
#   elsif input.downcase == "new location"
#     puts ""
#     runner
#   else
#     puts "Invalid input."
#     start_again
#   end
# end





#
# def print_ten(hash_array,iterator)
#   puts "
#   Here are the top spots in your area:
#   "
#   i = iterator
#   hash_array[iterator..(iterator+9)].each do |business|
#     i +=1
#     puts "#{i}. #{business['name']}"
#     business["location"]["display_address"].each do |address_line|
#       puts address_line
#     end
#     puts "**********************
#     "
#   end
#   puts "
#   Do any of these sound good?
#   If so, pick it by number. If you want to
#   see more, type 'MORE'. If you want to
#   choose a different location,  type
#   'NEW LOCATION'."
# end
#
# def start_again
#   puts "
#   Would you like to start again? Y/N"
#   input = gets.chomp()
#   if input == "Y"
#     runner
#   else
#     puts "Exiting."
#   end
# end


def picker(hash_array, number)
  name = hash_array[number]["name"]
  location = hash_array[number]["location"]["display_address"]

  #if karaoke place doesn't exist in database then create
  #NOTE WE'RE USING ** AS A DELIMITER
  if !KaraokePlace.all.locations.include?(location.join("**"))
    KaraokePlace.create(name: name,location: location.join("**"))
  else
    KaraokePlace.find_by(location: location.join("**"))
  end
end

# def input_interpreter(input, hash_array, iterator)
#   if input.downcase == "more"
#     if valid?(hash_array,(iterator+5))
#       "MORE"
#     else
#       puts "There are no more karaoke places near that location."
#       "NO MORE"
#     end
#   elsif input.downcase == "new location"
#     "New Location"
#   elsif
#
#
# end




# def get_karaoke_establishment_from_user()
# input = gets.chomp()
# if input == [] || nil
#   puts "There are no karaoke places near that location."
#    start_again
# elsif(i+1..i+5).include?(input.to_i)
# input.to_i-1
# elsif i >= hash_array.length
#   puts "There are no more karaoke places near that location.
#   Returning you to beginning of app."
#   binding.pry
#   runner
# elsif input.downcase == "more"
#   i += 5
#   print_ten(hash_array,i)
#   get_karaoke_establishment_from_user(hash_array,i)
# else
# end
# end
#
#

# def print_and_pick(hash_array)
#   iterator = 0
#   print_ten(hash_array,iterator)
#   answer = get_karaoke_establishment_from_user(hash_array, iterator)
#   picker(hash_array, answer)
# end
#
#
