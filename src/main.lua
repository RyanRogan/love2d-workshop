-- Import other files
require "player"
require "coin"
require "enemy"

function love.load()
    player_load()
    coin_load()
    enemy_load()
    
    -- Set Score to 0
    score = 0

    -- Add Enemies
    addEnemy(600, 100)
    addEnemy(100, 200)
    addEnemy(400, 300)
    addEnemy(200, 500)
end

function love.draw()
    player_draw()
    coin_draw()
    enemy_draw()

    -- Draw the score on the screen in the top left corner
    love.graphics.print("Score: "..score, 10, 10)
end

function love.update(dt)
    player_update(dt)
    coin_update(dt)
    enemy_update(dt)
end

function love.keypressed(key)
    -- If Esc key is pressed, quit the game
    if key == "escape" then
        print("Quitting the game. Goodbye!")
        love.event.push("quit")
    end
end

function resetGame()
    love.load()
end

-- Detect if 2 square objects has collided (assumes both objects have the x, y, w, and h attributes)
function hasCollided(obj1, obj2)
    return obj1.x < obj2.x + obj2.w and
    obj2.x < obj1.x + obj1.w and
    obj1.y < obj2.y + obj2.h and
    obj2.y < obj1.y + obj1.h
end