--[[
	触摸响应层
]]
local TouchLayer = class("TouchLayer", function()
    return display.newNode()
end)

function TouchLayer:ctor(params)
	self._func = params.func
    self:init()
end


function TouchLayer:init()
	local colorLayer = display.newColorLayer(ccc4(23,222,21,0))
	self:addChild(colorLayer, 0)

	-- 触摸事件
	colorLayer:setTouchSwallowEnabled(true)--是否允许 Node 吞噬触摸
	colorLayer:setTouchEnabled(true)
	colorLayer:setTouchMode(cc.TOUCH_MODE_ONE_BY_ONE)--设置单点触摸
	colorLayer:addNodeEventListener(cc.NODE_TOUCH_EVENT, function(event)
		--开始触摸
	    if event.name == "began" then
	    	--print("beganMask")
	    	return true 
	    --移动
	    elseif event.name == "moved" then
			--print("movedMask")
		--触摸结束
	    elseif event.name == "ended" then
			--print("endedMask")
	        -- 点击回调函数
	        if self._func then
	        	(self._func)()
	        end
	        return true
	    end
	    return false

	end)
end


	


return TouchLayer
