module Pgenerator
import Base.rand

type Password
    value :: Array{Char, 1}
end

function rand(::Type{Password}, n=10)
    Password([rand(33:'Z') for i in 1:n])
end

to_string(p::Password) = convert(String, p.value)

end
