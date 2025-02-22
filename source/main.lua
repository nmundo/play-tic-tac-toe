import "CoreLibs/graphics"
import "CoreLibs/ui"

local pd <const> = playdate
local gfx <const> = playdate.graphics

local grid = pd.ui.gridview.new(48, 48)
grid:setNumberOfColumns(3)
grid:setNumberOfRows(3)

-- function grid:drawCell(section, row, column, selected, x, y, width, height)


function pd.update()
    grid:drawInRect(40, 40, 144, 144)
    pd.timer.updateTimers()
end
