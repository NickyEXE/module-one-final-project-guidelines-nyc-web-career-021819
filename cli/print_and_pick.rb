
def get_karaoke_establishment_from_user(iterator)
  puts "Do any of these sound good?
  If so, pick it by number. If you want to
  see more, type 'MORE'. If you want to
  choose a different location,  type
  'NEW LOCATION'.
  "
  input = gets.chomp()
  if input.to_i.include?(iterator..iterator+4)
  num.to_i-1
elsif input == "MORE"
end

def print_and_pick(hash_array)
  iterator = 0
  print_five(hash_array,iterator)
  answer = get_karaoke_establishment_from_user

end


def print_five(hash_array,iterator)
  if iterator < hash_array.length
    puts "
    Here are the top spots in your area:
    "
    i = iterator
    hash_array[iterator..(iterator+4)].each do |business|
      i +=1
      puts "#{i}. #{business['name']}"
      business["location"]["display_address"].each do |address_line|
        puts address_line
      end
      puts "**********************
      "
    end
  elsif iterator > 0
    puts "There are no more matching karaoke places in your area."
    []
  else
    puts "There are no matching karaoke places in your area."
    []
  end
end
