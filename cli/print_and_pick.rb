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
    #recalls printer and then itself with a higher iterator
    printer(hash_array,iterator+5)
    karaoke_pick_inputter(hash_array,iterator+5)
  elsif input.downcase == "new location"
    runner
  elsif input.downcase == "exit"
    puts "Exiting application."
  elsif input.to_i > 0 && input.to_i < hash_array.length + 1
    #only valid option to get to the next page
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
