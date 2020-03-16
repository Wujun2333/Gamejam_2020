local utf8 = require("utf8")
--os.date("%D %I:%M:%S%p", os.time() - timeOffset * 60 * 60)



function love.load ()
    sprites={}
    sprites.p1 = love.graphics.newImage('assets/1.png')
    sprites.p2 = love.graphics.newImage('assets/2.png')
    sprites.p3 = love.graphics.newImage('assets/3.png')
    sprites.nono = love.graphics.newImage('assets/nono.png')

    photos={}
    photos.a1 = love.graphics.newImage('assets/a1.png')
    photos.a2 = love.graphics.newImage('assets/a2.png')
    photos.a3 = love.graphics.newImage('assets/a3.png')
    photos.a4 = love.graphics.newImage('assets/a4.png')
    photos.a5 = love.graphics.newImage('assets/a5.png')
    photos.a6 = love.graphics.newImage('assets/a6.png')
    photos.a7 = love.graphics.newImage('assets/a7.png')
    photos.a8 = love.graphics.newImage('assets/a8.png')
    photos.a9 = love.graphics.newImage('assets/a9.png')
    photos.a10 = love.graphics.newImage('assets/a10.png')
    --sprites.p4 = love.graphics.newImage('assets/4.png')

    gameState=1
    require('number')
    
    myFont = love.graphics.newFont(20, hitting)
    font = love.graphics.newImageFont("assets/imagefont.png",
    " abcdefghijklmnopqrstuvwxyz" ..
    "ABCDEFGHIJKLMNOPQRSTUVWXYZ0" ..
    "123456789.,!?-+/():;%&`'*#=[]\"")

    text = "my name is -- "
    love.keyboard.setKeyRepeat(true)
    input = ""

    Now = os.date('*t') --get the date/time
    --[[print(Now.year)
    print(Now.month)
    print(Now.day)
    print(Now.hour)
    print(Now.min)]]
    date = ""

end

function love.textinput(t)    
    if gameState == 3 then 
        input = input .. t
    end
end



function love.update(dt)


end



function love.draw()
--love.graphics.print(love. graphics. getWidth())
--love.graphics.print(love. graphics. getHeight())
    if gameState == 1 then
        love.graphics.draw(sprites.p1)
        love.graphics.setFont(font) 
    elseif
    gameState == 2 then
        love.graphics.draw(sprites.p2) 
        elseif
    gameState == 3 then
        love.graphics.draw(sprites.p3)
        love.graphics.setFont(font)
        love.graphics.printf(text, 30, 50, love.graphics.getWidth())
        love.graphics.printf(input, 200, 50, love.graphics.getWidth()) elseif
    gameState == 4 then
        if  input == "wujun" then                 
            printPhoto(photos.a1)     
            elseif input == "cindy" or input == "cindy wang" or input == "Cindy" then          
            printPhoto(photos.a4)
            elseif input == "nono kros" or input == "nono" or input == "kros" or input == "Nono Kros" then
            printPhoto(sprites.nono)         
            else 
            calculateLetter()       
        end
    end


    


end


function love.keypressed (key, scancode, isRepeat)

      if gameState == 3 and key == "backspace" then
        -- get the byte offset to the last UTF-8 character in the string.
        --local byteoffset = utf8.offset(text, -1)
        local byteoffset = utf8.offset(input, -1)
        
 
        if byteoffset then
            -- remove the last UTF-8 character.
            -- string.sub operates on bytes rather than UTF-8 characters, so we couldn't do string.sub(text, 1, -2).
            --text = string.sub(text, 1, byteoffset - 1)
            input = string.sub(input, 1, byteoffset - 1)
        end
    end


    if gameState == 1 and key == "return" then
            gameState = gameState+1 elseif
        gameState ==2 and key == "return"   then
            gameState = gameState+1 elseif
        gameState == 3 and key == "return" and input ~= "" then 
            gameState = 4 elseif
        gameState == 4 and key == "return" then
            gameState = 1
    end
end 