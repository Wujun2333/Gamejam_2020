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

    while photoNumber > 12 do
        photoNumber = photoNumber - 12
    end   
    print ("a"..photoNumber) 


    --I really need to think of a better way to do this... maybe later
    if photoNumber == 1 then 
    printPhoto(photos.a1)  
    end   
    if photoNumber == 2 then 
    printPhoto(photos.a2)  
    end
    if photoNumber == 3 then 
    printPhoto(photos.a3)  
    end
    if photoNumber == 4 then 
    printPhoto(photos.a4)  
    end
    if photoNumber == 5 then 
    printPhoto(photos.a5)  
    end
    if photoNumber == 6 then 
    printPhoto(photos.a6)  
    end
    if photoNumber == 7 then 
    printPhoto(photos.a7)  
    end
    if photoNumber == 8 then 
    printPhoto(photos.a8)  
    end
    if photoNumber == 9 then 
    printPhoto(photos.a9)  
    end
    if photoNumber == 10 then 
    printPhoto(photos.a10)  
    end
    if photoNumber == 11 then 
    printPhoto(photos.a11)  
    end
    if photoNumber == 12 then 
    printPhoto(photos.a12)  
    end


end

function printDate()
    love.graphics.printf(input, 280, 450, love.graphics.getWidth())
    love.graphics.print(Now.month.."/"..Now.day.. "/"..Now.year.."  "..Now.hour..":".. Now.min, 280, 465)
    --[[print(Now.year)
    print(Now.month)
    print(Now.day)
    print(Now.hour)
    print(Now.min)]]
end

function printPhoto(p)
    love.graphics.draw(sprites.p1) 
    love.graphics.draw(p, 400, 300, nil, 0.6, 0.6, photos.a1:getWidth()/2, photos.a1:getHeight()/2)
    printDate()
end
