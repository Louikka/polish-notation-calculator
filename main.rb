require_relative 'lib/utils'
require_relative 'lib/pn'
require_relative 'lib/rpn'


# print help message
if ARGV.include?("-h") || ARGV.include?("--help")
    puts <<~HEREDOC
        === Polish notation calculator ===

        The program requires one space between each number/operator (e.g. "+ 123 45"
        or "1 2 3 * +"). Note, that program will automatically detect kind of the
        notation.

        The program also can take number of flags:
            -h, --help    prints out this message
            -r, --repeat  puts program in the loop
    HEREDOC

    exit(0)
end


# if loop
is_loop = false

if ARGV.include?("-r") || ARGV.include?("--repeat")
    is_loop = true
end



loop do
    print ">>> "
    user_input = STDIN.gets().chomp().strip().upcase()

    if user_input == "Q"
        break
    end

    arr = user_input.split(" ").reject(&:empty?)
    # if starts with a number - then its rpn; otherwise - pn
    is_rpn = is_numeric?(arr[0]) #user_input.match?(/^\d/)

    result = 0
    err = nil

    if is_rpn
        result, err = calculate_rpn(arr)
    else
        result, err = calculate_pn(arr)
    end

    if err != nil
        puts err
        break
    end

    puts "%g" % result


    if is_loop
        puts ""
    else
        break
    end
end
