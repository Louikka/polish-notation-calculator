# encoding: utf-8
# frozen_string_literal: false
# warn_indent: true
# shareable_constant_value: none

require './lib/utils'


puts "\e[1mPolish notation calculator.\e[22m" # bold



def calculate_stack(stack)
    if stack.length < 3
        return "Too few arguments in stack."
    end

    stack_cpy = Marshal.load(Marshal.dump(stack))

    stack_cpy.each_with_index do |v, i|
        if is_numeric?(v)
            stack_cpy[i] = v.to_f()
        end
    end


    while stack_cpy.length > 1
        stack_cpy.each_with_index do |v, i|
            if [ "+", "-", "*", "/" ].include?(v)
                if ( is_numeric?(stack_cpy[i + 1]) and is_numeric?(stack_cpy[i + 2]) )
                    case v
                    when "+"
                        stack_cpy[i, 3] = stack_cpy[i + 1] + stack_cpy[i + 2]
                    when "-"
                        stack_cpy[i, 3] = stack_cpy[i + 1] - stack_cpy[i + 2]
                    when "*"
                        stack_cpy[i, 3] = stack_cpy[i + 1] * stack_cpy[i + 2]
                    when "/"
                        stack_cpy[i, 3] = stack_cpy[i + 1] / stack_cpy[i + 2]
                    else
                        return "Somenthing went wrong."
                    end
                end
            end
        end
    end

    return stack_cpy[0]
end


user_input = gets().chomp().strip()

if user_input == "q"
    exit(0)
end

result = calculate_stack(user_input.split(" "))

puts (result == result.to_i()) ? result.to_i() : result
