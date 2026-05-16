def is_numeric?(str)
    return true if str.is_a?(Numeric)
    return false if !str.is_a?(String)
    return (Float(str) != nil rescue false)
end
