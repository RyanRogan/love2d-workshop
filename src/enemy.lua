function enemy_load()
    enemies = {}
    enemy_width = 300
    enemy_height = 20
    enemy_speed = 200
end

function enemy_draw()
    -- Make enemy Red
    love.graphics.setColor(1,0,0)
    -- Loop through the list of enemies
    for k,v in ipairs(enemies) do
        -- Draw enemy
        love.graphics.rectangle("fill", v.x, v.y, enemy_width, enemy_height)
    end
    -- Reset colour to white
    love.graphics.setColor(1,1,1)
end

function enemy_update(dt)
    for i, v in ipairs(enemies) do
        -- Move enemy
        v.x = v.x + enemy_speed * dt

        -- Respawn enemy when they are off screen
        if v.x > love.graphics.getWidth() then
            v.x = 0 - v.w
        end

        -- Collision with player
        if hasCollided(player, v) then
            resetGame()
        end
    end
end

function addEnemy(x, y)
    table.insert(enemies, {x=x, y=y, w=enemy_width, h=enemy_height})
end