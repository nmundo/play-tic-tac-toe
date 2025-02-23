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

local boardState = table.create(9, 0)
boardState[1] = 'X'
boardState[2] = 'O'
boardState[3] = 'X'
boardState[4] = 'O'
boardState[5] = 'X'
boardState[6] = 'O'
boardState[7] = 'X'
boardState[8] = 'O'
boardState[9] = 'X'

function grid:drawCell(section, row, column, selected, x, y, width, height)
    local cellState = boardState[(row - 1) * 3 + column]
    if selected then
        gfx.fillRect(x, y, width, height)
        gfx.setImageDrawMode(gfx.kDrawModeFillWhite)
    else
        gfx.drawRect(x, y, width, height)
        gfx.setImageDrawMode(gfx.kDrawModeCopy)
    end

    local fontHeight = gfx.getSystemFont():getHeight()
    if cellState == 'X' or cellState == 'O' then
        gfx.drawTextInRect("*"..cellState.."*", x, y + (height / 2 - fontHeight / 2) + 2, width, height, nil, nil, kTextAlignment.center)
    end
end

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
