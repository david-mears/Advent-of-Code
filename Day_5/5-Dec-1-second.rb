input = ''
File.open("Day_5/input5").each do |line|
  input = line
end

def change_string_once(string)
  
  to_change = []
  string.chars.each.with_index do |letter, index|
    if to_change == [] && index+1 != string.length
      if string[index] != string[index+1] && string[index].downcase == string[index+1].downcase
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

puts change_string_once(gets.chomp)

previous_string = input 
until previous_string == input
end