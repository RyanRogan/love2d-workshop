
function coin_load()
    coin = {
        x = 200,
        y = 100,
        w = 20,
        h = 20
    }
end

function coin_draw()
    -- Change the color to yellow
    love.graphics.setColor(love.math.colorFromBytes(255,255,0))
    
    -- Draw the coin
    love.graphics.rectangle("fill", coin.x, coin.y, coin.w, coin.h)
    
    -- reset the color to white for objects drawn after the coin
    love.graphics.setColor(1,1,1) 
end

function coin_update(dt)
    -- Check if the coin has collided with the player
    if hasCollided(player, coin) then
        -- Change the coin's x position to a random number between 0 and the window's width minus the coin's width to make sure it doesn't spawn off screen
        coin.x = math.random(0, love.graphics.getWidth() - coin.w)
        -- Set the coin's y position to a random number between 0 and the window's height minus the coin's height
        coin.y = math.random(0, love.graphics.getHeight() - coin.h)
        -- Add 1 to the score
        score = score + 1
    end
end