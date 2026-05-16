require_relative 'utils'


# takes array of values (e.g. [ "+", "1", "2" ])
# and returns [result, error] as [number (float), string | nil]
def calculate_pn(arr)
    if arr.length < 3
        return 0, "Too few arguments."
    end

    stack = []

    arr.each do |v|
        if is_numeric?(v)
            stack.push(v.to_f())
        else
            stack.push(v)
        end
    end


    while stack.length > 1
        stack.each_with_index do |v, i|
            if [ "+", "-", "*", "/" ].include?(v)
                if ( is_numeric?(stack[i + 1]) and is_numeric?(stack[i + 2]) )
                    case v
                    when "+"
                        stack[i, 3] = stack[i + 1] + stack[i + 2]
                    when "-"
                        stack[i, 3] = stack[i + 1] - stack[i + 2]
                    when "*"
                        stack[i, 3] = stack[i + 1] * stack[i + 2]
                    when "/"
                        stack[i, 3] = stack[i + 1] / stack[i + 2]
                    else
                        return 0, "Unexpected token \"#{v}\"."
                    end
                end
            end
        end
    end

    return stack[0], nil
end
