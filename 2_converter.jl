module Tconverter
export convert
import Base.convert

abstract Temperature

type Celsius <: Temperature
    value :: Real
end

type Kelvin <: Temperature
    value :: Real
end

type Fahrenheit <: Temperature
    value :: Real
end

convert(::Type{Kelvin}, a::Celsius) = Kelvin(a.value + 273.15)
convert(::Type{Fahrenheit}, a::Celsius) = Fahrenheit((a.value * 1.8) + 32)

convert(::Type{Celsius}, a::Kelvin) = Celsius(a.value - 273.15)
function convert(::Type{Fahrenheit}, a::Kelvin)
    t = convert(Celsius, a)
    convert(Fahrenheit, t)
end

convert(::Type{Celsius}, a::Fahrenheit) = Celsius((a.value - 32) * 5/9)
function convert(::Type{Kelvin}, a::Fahrenheit)
    t = convert(Celsius, a)
    convert(Kelvin, t)
end

end
