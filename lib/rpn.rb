# encoding: utf-8
# frozen_string_literal: false
# warn_indent: true
# shareable_constant_value: none

require_relative 'utils'


def calculate_rpn(stack)
    if stack.length < 3
        return "Too few arguments in stack."
    end
    if !is_numeric?(stack[0]) || !is_numeric?(stack[1])
        return "First or second argument in not a number."
    end

    #stack_cpy = Marshal.load(Marshal.dump(stack))
    __stack = []

    for v in stack
        if is_numeric?(v)
            __stack.push(v.to_f())
        else
            case v
            when "+"
                __stack.push(__stack.shift() + __stack.shift())
            when "-"
                __stack.push(__stack.shift() - __stack.shift())
            when "*"
                __stack.push(__stack.shift() * __stack.shift())
            when "/"
                __stack.push(__stack.shift() / __stack.shift())
            when "="
                return __stack[1]
            else
                return "Unexpected token \"#{ v }\"."
            end
        end
    end

    return __stack[0]
end
