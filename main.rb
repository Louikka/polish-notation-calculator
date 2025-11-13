# encoding: utf-8
# frozen_string_literal: false
# warn_indent: true
# shareable_constant_value: none

require_relative 'lib/pn'
require_relative 'lib/rpn'


print "\e[1mPolish notation calculator.\e[22m\n" # bold


user_input = gets().chomp().strip()

if user_input == "q"
    exit(0)
end

result = ""

if user_input.match?(/^\d/)
    result = calculate_rpn(user_input.split(" "))
else
    result = calculate_pn(user_input.split(" "))
end

puts (result == result.to_i()) ? result.to_i() : result
