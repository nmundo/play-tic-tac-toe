import "CoreLibs/graphics"
import "CoreLibs/ui"
import "CoreLibs/sprites"

local pd <const> = playdate
local gfx <const> = playdate.graphics

local grid = pd.ui.gridview.new(50, 50)
grid:setNumberOfColumns(3)
grid:setNumberOfRows(3)

local gridSprite = gfx.sprite.new()
gridSprite:setCenter(0, 0)
gridSprite:moveTo(40, 40)
gridSprite:add()


function pd.update()
    if pd.buttonJustPressed(pd.kButtonUp) then
        grid:selectPreviousRow(false)
    elseif pd.buttonJustPressed(pd.kButtonDown) then
        grid:selectNextRow(false)
    elseif pd.buttonJustPressed(pd.kButtonLeft) then
        grid:selectPreviousColumn(false)
    elseif pd.buttonJustPressed(pd.kButtonRight) then
        grid:selectNextColumn(false)
    end

    local gridImage = gfx.image.new(154, 154)
    gfx.pushContext(gridImage)
        grid:drawInRect(0, 0, 154, 154)
    gfx.popContext()
    gridSprite:setImage(gridImage)

    gfx.sprite.update()
    pd.timer.updateTimers()
end
