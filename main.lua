local utf8 = require("utf8")
--os.date("%D %I:%M:%S%p", os.time() - timeOffset * 60 * 60)



function love.load ()
    sprites={}
    sprites.p1 = love.graphics.newImage('assets/1.png')
    sprites.p2 = love.graphics.newImage('assets/2.png')
    sprites.p3 = love.graphics.newImage('assets/3.png')
    sprites.nono = love.graphics.newImage('assets/nono.png')
    sprites.flash = love.graphics.newImage('assets/flash.png')
    sprites.print = love.graphics.newImage('assets/print.png')

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
    anim8 = require('anim8-master/anim8')
    
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

    local g  = anim8.newGrid(800, 600, sprites.flash:getWidth(), sprites.flash:getHeight())
    local f  = anim8.newGrid(800, 600, sprites.print:getWidth(), sprites.print:getHeight())
    animation = anim8.newAnimation(g('1-2',1,'1-2',2,'1-2',3,'1-2',4),0.2)
    animation2 = anim8.newAnimation(f('1-3',1,'1-3',2,'1-3',3,'1-3',4),0.1)
    maxTime= 2.75
    timer = maxTime
end

function love.textinput(t)    
    if gameState == 3 then 
        input = input .. t
    end
end



function love.update(dt)
    animation:update(dt)
    animation2:update(dt)
    if gameState == 4 or gameState == 5 then
        timer = timer - dt
        print(timer)
        print(gameState)
        if timer <= 1.5 and timer > 0 then
            gameState = 5 
            print(gameState)elseif
            
            timer <= 0 then 
            gameState = 6
            timer = maxTime
            print(gameState)
            
        end
        
    end
end



function love.draw()
--love.graphics.print(love. graphics. getWidth())
--love.graphics.print(love. graphics. getHeight())
    if gameState == 1 then
        love.graphics.draw(sprites.p1)
        love.graphics.setFont(font) 
        love.graphics.printf("press enter to begin", 510, 540, love.graphics.getWidth())
    elseif
    gameState == 2 then
        love.graphics.draw(sprites.p2) elseif
    gameState == 3 then
        love.graphics.draw(sprites.p3)
        love.graphics.setFont(font)
        love.graphics.printf(text, 40, 50, love.graphics.getWidth())
        love.graphics.printf(input, 200, 50, love.graphics.getWidth()) elseif
    gameState == 4 then 
        animation:draw(sprites.flash, 0, 0) elseif
    gameState == 5 then 
        animation2:draw(sprites.print, 0, 0) elseif
    gameState == 6 then
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
            gameState = 2 elseif
        gameState == 2 and key == "return"   then
            gameState = 3 elseif
        gameState == 3 and key == "return" and input ~= "" then 
            gameState = 4 elseif
        gameState == 6 and key == "return" then
            gameState = 1
    end
end 