module Generator
export gen
using Base.Regex
import Base.rand

const vovels = ['a', 'o', 'e', 'u', 'y', 'i']
const consonants = filter(x -> !(x in vovels), 'a':'z')

const letters = 'a':'z'

const vrx = Regex("[$(convert(String, vovels))]{2}\$")
const crx = Regex("[$(convert(String, consonants))]{2}\$")

function rand(a::Array)
    a[rand(1:length(a))]
end

function gen(len=5)
    res = ""
    for _ in 1:len
        if match(vrx, res) != nothing
            next = rand(consonants)
        elseif match(crx, res) != nothing
            next = rand(vovels)
        else
            next = rand(letters)
        end
        println("current: $res, next: $next")
        res *= string(next)
    end
    res
end

function gen_many(amount=5, len=5)
    [gen(len) for _ in 1:amount]
end

println(gen(5))

end
