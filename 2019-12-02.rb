input = [1,0,0,3,1,1,2,3,1,3,4,3,1,5,0,3,2,1,6,19,2,19,6,23,1,23,5,27,1,9,27,31,1,31,10,35,2,35,9,39,1,5,39,43,2,43,9,47,1,5,47,51,2,51,13,55,1,55,10,59,1,59,10,63,2,9,63,67,1,67,5,71,2,13,71,75,1,75,10,79,1,79,6,83,2,13,83,87,1,87,6,91,1,6,91,95,1,10,95,99,2,99,6,103,1,103,5,107,2,6,107,111,1,10,111,115,1,115,5,119,2,6,119,123,1,123,5,127,2,127,6,131,1,131,5,135,1,2,135,139,1,139,13,0,99,2,0,14,0]

def process_at_index(input, i)
  opcode = input[i]
  if opcode == 1 || opcode == 2
    operand_1 = input[input[i + 1]]
    operand_2 = input[input[i + 2]]
    target = input[i + 3]
    value = opcode == 1 ? operand_1 + operand_2 : operand_1 * operand_2
    input[target] = value 
    process_at_index(input, i + 4)
  elsif opcode == 99
    return
  else
    raise ArgumentError, "unknown opcode #{opcode}"
  end
end

part_1_input = input.clone
process_at_index(part_1_input, 0)

#part 1
puts part_1_input.join(',')

#part 2

def find_params(input, x_range, y_range)
  expected_result = 19690720
  for x in x_range do
    for y in y_range do
      part_2_input = input.clone
      part_2_input[1] = x
      part_2_input[2] = y
      process_at_index(part_2_input, 0)
      if part_2_input[0] == expected_result
        puts "#{x}, #{y}"
        return
      end
    end
  end
end

find_params(input, 0..99, 0..99)

