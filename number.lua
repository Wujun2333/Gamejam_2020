letters = {}


function getFirstNumber()

    local s = input
    local i = 1
    x = string.sub(s, i, i)


    

end

function calculateLetter()

    getFirstNumber()

    if x == "a" or x == "h" or x == "c"or x == "j"or x == "e"or x == "f" 
    then
        x = 1 elseif
    x == "g" or x == "b" or x == "i" or x == "d"  or x == "k"  or x == "l"
    then
    x = 2 else 
    x = 0       
    end
    

    local s = input
     
    photoNumber = #s + x

    while photoNumber > 10 do
        photoNumber = photoNumber - 10
    end

    
    print (photoNumber)    
    
end