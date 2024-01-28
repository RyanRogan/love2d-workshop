
function player_load()
    player = {
        x = 100,
        y = 400,
        w = 50,
        h = 50,
        speed = 150
    }
end

function player_draw()
    love.graphics.rectangle("fill", player.x, player.y, player.w, player.h)
end

function player_update(dt)
    if love.keyboard.isDown("w") then
        player.y = player.y - player.speed * dt
    elseif love.keyboard.isDown("s") then
        player.y = player.y + player.speed * dt
    end

    if love.keyboard.isDown("d") then
        player.x = player.x + player.speed * dt
    elseif love.keyboard.isDown("a") then
        player.x = player.x - player.speed * dt
    end
end