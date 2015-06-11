--
-- Author: student
-- Date: 2015-06-08 19:47:12
--

scheduler=require("framework.scheduler")
local zixuan=class("zixuan", function( )
	return display.newScene()
end)

function zixuan:ctor( )
	self:init()
end

function zixuan:init( )
	local png="ying.png"
	local plist="ying.plist"
	display.addSpriteFrames(plist,png)
	self._sp=display.newSprite("#ying1.png")
	self._sp:pos(200, 200)
	self:addChild(self._sp,1)
	local frames=display.newFrames("ying%d.png",1,15)
	local animation=display.newAnimation(frames,0.08)
	local animate=cc.Animate:create(animation)
	self._sp:playAnimationForever(animation,0.1)
	local moveto1=cc.MoveTo:create(3,cc.p(display.cx+250,200))
	local filp1=cc.FlipX:create(true)
	local moveto2=cc.MoveTo:create(3,cc.p(200,200))
	local filp2=cc.FlipX:create(false)
	local seq=cc.Sequence:create(moveto1,filp1,moveto2,filp2)
	local pawn=cc.Spawn:create(animate,seq)
	local r=cc.RepeatForever:create(pawn)
	self._sp:runAction(r)


    sea1=display.newSprite("sea1.png")
	local scalex=display.width/sea1:getContentSize().width
	local scaley=display.height/sea1:getContentSize().height
	sea1:setAnchorPoint(cc.p(0,0))
	sea1:setPosition(cc.p(0,0))
	sea1:setScaleX(scalex)
	sea1:setScaleY(scaley)
	sea1:addTo(self)

    sea2=display.newSprite("sea1.png")
	local scalex1=display.width/sea2:getContentSize().width
	local scaley1=display.height/sea2:getContentSize().height
	sea2:setAnchorPoint(cc.p(0,0))
	sea2:setScale(scalex1,scaley1)
	-- sea2:setScaleX(scalex1)
	-- sea2:setScaleY(scaley1)
	sea2:pos(0,0)
	-- sea2:setScaleX(-scalex1)
	sea2:addTo(self)

    
    

    
    -- scheduler.scheduleGlobal(handler(self,self.update),0.1)
    scheduler.scheduleGlobal(handler(self, self.fishupdate),5)
    i=0
	 
end

function zixuan:fishupdate( dt )
	local j=math.random(1,100)
    print(j)
    if j%2==0 then
    	local fishpng="mainFish.png"
        local fishplist="mainFish.plist"
        display.addSpriteFrames(fishplist,fishpng)
        self.fish=display.newSprite("#fish001.png")
        self.fish:setScale(0.5, 0.5)
        self.fish:pos(0, display.cy)
        self.fish:addTo(self,1)
        local fishframe=display.newFrames("fish00%d.png",1,3)
        local animation=display.newAnimation(fishframe,0.08)
        local animate=cc.Animate:create(animation)
        self.fish:playAnimationForever(animation, 0.1)
    	local fishmove1=cc.MoveTo:create(2,cc.p(display.width,display.cy))
    	local fishfilb=cc.FlipX:create(true)
    	local fishmove2=cc.MoveTo:create(2,cc.p(0,display.cy-100))
    	local fishfilb1=cc.FlipX:create(false)
    	local fishseq=cc.Sequence:create(fishmove1,fishfilb,fishmove2,fishfilb1)
    	local fishpawn=cc.Spawn:create(fishseq,animate)
    	local fishrepeat=cc.RepeatForever:create(fishpawn)
    	self.fish:runAction(fishrepeat)
    elseif j%2~=0 then
    	local fishpng="mainFish.png"
        local fishplist="mainFish.plist"
        display.addSpriteFrames(fishplist,fishpng)
        self.fish=display.newSprite("#fish001.png")
        self.fish:setScale(0.5, 0.5)
        self.fish:pos(display.width, display.cy+100)
        self.fish:setScaleX(-0.5)
        self.fish:addTo(self,1)
        local fishframe=display.newFrames("fish00%d.png",1,3)
        local animation=display.newAnimation(fishframe,0.08)
        local animate=cc.Animate:create(animation)
        self.fish:playAnimationForever(animation, 0.1)
    	local fishmove1=cc.MoveTo:create(2,cc.p(0,display.cy+100))
    	local fishfilb=cc.FlipX:create(true)
    	local fishmove2=cc.MoveTo:create(2,cc.p(display.width,display.cy+200))
    	local fishfilb1=cc.FlipX:create(false)
    	local fishseq=cc.Sequence:create(fishmove1,fishfilb,fishmove2,fishfilb1)
    	local fishpawn=cc.Spawn:create(fishseq,animate)
    	local fishrepeat=cc.RepeatForever:create(fishpawn)
    	self.fish:runAction(fishrepeat)
    end
end
function zixuan:update( dt)
	-- i=i-10
	-- if i==-960 then
	-- 	i=0
	-- end
	-- sea1:setPosition(cc.p(i,0))
	-- sea2:setPosition(cc.p(960+i,0))
	local fishx,fishy=sea1:getPosition()
	-- print(fishx)
	sea1:setPositionX(fishx-10)
	local fishx1,fishy1=sea1:getPosition()
	-- print(fishx1)
	local fishw=display.width
	-- print(fishw) 
	sea2:setPositionX(fishx1+fishw)
	local sea2x,sea2y=sea2:getPosition()
	if  sea2x==0 then
		print("我")
		sea1:setPositionX(0)
	end
end
return zixuan