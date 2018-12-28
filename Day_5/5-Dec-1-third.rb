input = ''
File.open("Day_5/input5").each do |line|
  input = line
end

def opposites?(a, b)
  return (a != b && a.downcase == b.downcase)
end

def one_complete_pass(str)
  
  # Two arrays, each alike in dignity.
  
  source = str.chars
  target = []
  
  did_i_change_str = false
  
  skip_next_letter = false
  source.each.with_index do |letter, index|
    if skip_next_letter == false
      next_letter = str[index+1]
      if index == str.length-1 || !opposites?(letter, next_letter)
        target.push(letter)
      else
        did_i_change_str = true
        skip_next_letter = true
      end
    else
      skip_next_letter = false
    end
  end
  
  return [target, did_i_change_str]
end

def iterate_pass(str)
  new_str, did_i_change_str = one_complete_pass(str)
  
  count = 0
  loop do
    count += 1
    new_str, did_i_change_str = one_complete_pass(new_str.join)
    break if !did_i_change_str
  end
  return new_str
end

puts iterate_pass(input).length