module HangmanGame
import Base.rand

type Word
    string :: String
end

const words_file = "/usr/share/dict/words"
const size = filesize(words_file)

function random_line(stream)
    i = rand(1:size-100)
    seek(stream, i)
    readline(stream)
    readline(stream)[1:end-1]
end

function rand(::Type{Word})
    Word(open(random_line, words_file))
end

function go(max_misses=9)
    word = rand(Word)
    @printf("word size: %d\n", length(word.string))
    hits = Char[] #:: Array{Char, 1}
    misses = Char[] #:: Array{Char, 1}
    while length(misses) < max_misses
        print("word: ")
        for i in word.string
            if i in hits
                print(i)
            else
                print('_')
            end
        end
        println()
        println("guesses: $(sort(cat(1, hits, misses)))")
        left_letters = filter(x -> !(x in hits || x in misses), 'a':'z')
        println("left: $left_letters")
        println("misses left: $(max_misses - length(misses))")
        print("guess> ")
        g = lowercase(readline(STDIN)[1])
        if g in 'a':'z'
            if g in word.string
                println("Hit!")
                push!(hits, g)
                if all(x -> x in hits, word.string)
                    println("you win, word: $(word.string)")
                    return
                end
            else
                println("Miss")
                push!(misses, g)
            end
        end
    end
    println("you lose, word: $(word.string)")
end

end
