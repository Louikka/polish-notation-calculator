# encoding: utf-8
# frozen_string_literal: false
# warn_indent: true
# shareable_constant_value: none

def is_numeric?(str)
    return true if str.is_a?(Numeric)
    return false if !str.is_a?(String)
    return (Float(str) != nil rescue false)
end
