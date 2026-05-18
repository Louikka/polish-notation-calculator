# Determines if value is a number.
def is_numeric?(value)
    return true if value.is_a?(Numeric)
    return false if !value.is_a?(String)
    return (Float(value) != nil rescue false)
end
