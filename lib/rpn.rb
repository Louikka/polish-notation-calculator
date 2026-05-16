require_relative 'utils'


# takes array of values (e.g. [ "1", "2", "+" ])
# and returns [result, error] as [number (float), string | nil]
def calculate_rpn(arr)
    if arr.length < 3
        return 0, "Too few arguments."
    end
    if !is_numeric?(arr[0]) || !is_numeric?(arr[1])
        return 0, "RPN : First or second argument is not a number."
    end

    stack = []

    for v in arr
        if is_numeric?(v)
            stack.push(v.to_f())
        else
            case v
            when "+"
                stack.push(stack.pop() + stack.pop())
            when "-"
                stack.push(stack.pop() - stack.pop())
            when "*"
                stack.push(stack.pop() * stack.pop())
            when "/"
                stack.push(stack.pop() / stack.pop())
            # ???
            # when "="
            #     return stack[1], nil
            else
                return 0, "Unexpected token \"#{v}\"."
            end
        end
    end

    return stack[0], nil
end
