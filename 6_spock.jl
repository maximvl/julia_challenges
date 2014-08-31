module RockPaper
import Base.isless
import Base.rand

abstract Variant

type Rock <: Variant
end

type Paper <: Variant
end

type Scissors <: Variant
end

type Lizard <: Variant
end

type Spock <: Variant
end

isless(::Type{Scissors}, ::Type{Rock}) = true
isless(::Type{Lizard}, ::Type{Rock}) = true

isless(::Type{Rock}, ::Type{Paper}) = true
isless(::Type{Spock}, ::Type{Paper}) = true

isless(::Type{Paper}, ::Type{Scissors}) = true
isless(::Type{Lizard}, ::Type{Scissors}) = true

isless(::Type{Spock}, ::Type{Lizard}) = true
isless(::Type{Paper}, ::Type{Lizard}) = true

isless(::Type{Scissors}, ::Type{Spock}) = true
isless(::Type{Rock}, ::Type{Spock}) = true

isless{T<:Variant,V<:Variant}(::Type{T}, ::Type{V}) = !isless(V, T)

const rands = [Rock, Scissors, Paper, Lizard, Spock]

function rand(::Type{Variant})
    rands[rand(1:5)]
end

function go()
    v1 = rand(Variant)
    println("player1 rolled: $v1")
    v2 = rand(Variant)
    println("player2 rolled: $v2")
    if v1 == v2
        println("rerolling")
        go()
    else
        @printf("winner: %s", v1 > v2 ? "player1" : "player2")
    end
end

end
