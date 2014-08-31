module FuzzBuzz

function fuzz(a)
    flag = false
    if rem(a, 3) == 0
        print("fuzz")
        flag = true
    end
    if rem(a, 5) == 0
        print("buzz")
        flag = true
    end
    if !flag
        print(a)
    end
    println()
end

function fuzzbuzz(range)
    for i in range
        fuzz(i)
    end
end

end
