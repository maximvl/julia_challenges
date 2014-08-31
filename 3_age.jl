module TimeUnits
import Base.convert

abstract TimeUnit

type Second <: TimeUnit
    value :: Real
end

type Minute <: TimeUnit
    value :: Real
end

type Hour <: TimeUnit
    value :: Real
end

type Day <: TimeUnit
    value :: Real
end

type Month <: TimeUnit
    value :: Real
end

type Year <: TimeUnit
    value :: Real
end

type Age <: TimeUnit
    value :: Real
end

function convert(::Type{Second}, a::Minute)
    Second(a.value * 60)
end

function convert(::Type{Minute}, a::Hour)
    Minute(a.value * 60)
end

function convert(::Type{Hour}, a::Day)
    Hour(a.value * 24)
end

function convert(::Type{Day}, a::Year)
    Day(a.value * 365)
end

function convert(::Type{Year}, a::Age)
    Year(a.value * 1000)
end

function convert(::Type{Second}, a::Hour)
    t = convert(Minute, a)
    convert(Second, t)
end

function convert(::Type{Second}, a::Day)
    t = convert(Hour, a)
    convert(Second, t)
end

function convert(::Type{Second}, a::Year)
    t = convert(Day, a)
    convert(Second, t)
end

function convert(::Type{Second}, a::Age)
    t = convert(Year, a)
    convert(Second, t)
end

function convert(::Type{Day}, a::Age)
    t = convert(Year, a)
    convert(Day, t)
end

end
