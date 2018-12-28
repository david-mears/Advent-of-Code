input = ''
File.open("Day_5/input5").each do |line|
  input = line
end

def change_string_once(string)
  
  to_change = []
  string.chars.each.with_index do |letter, index|
    
    if to_change == [] && index < string.length-1
      next_letter = string[index+1]
      if letter != next_letter && letter.downcase == next_letter.downcase
        to_change.push(index)
      end
    end
    # We should have one number in to_change.
  end
  
  if to_change != []
    i = to_change[0]
  else
    return string
  end
  
  if i == 0
    return string[2..-1]
  else
    return string[0..i-1] + string[i+2..-1]
  end
  
end

previous_string = ''
until previous_string == input
  puts input.length
  previous_string = input
  input = change_string_once(input)
end

puts "finished"

puts input