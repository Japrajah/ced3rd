local d3dobject = ed3d.createD3DHook()

d3dobject.createForm("f1","Cheats by Japrajah & Scub",350,170) -- formname,caption,width,height
d3dobject.createForm("f2","Debug",250,140)
d3dobject.createForm("extra","extra",250,120)

d3dobject.createOnOffToggle("oot1","ESP Team","f1", 10,30) --name,caption,formname,x,y
d3dobject.createOnOffToggle("oot2","LBGTRED 2","f1", 10,50)
d3dobject.createOnOffToggle("oot3","dbg","extra", 10,30)

d3dobject.createButton("btn1","Creators","f1",3,140)

d3dobject.createLabel("lbl1","Japrajah","f2",10,30,12) -- name,caption,formname,size,x,y -- 1
d3dobject.createLabel("lbl2","Scub","f2",10,50,12)
d3dobject.createLabel("lbl3","test3","f2",10,70,12)
d3dobject.createLabel("lbl4","test","f2",10,90,12) -- 2

d3dobject.formToTop("f2") -- make form "f2" on top

d3dobject.onclick = function (sender,x,y)

   d3dobject.formDragToggleClick("f1",sender,x,y) -- make the form drag mode if the form clicked
   d3dobject.formDragToggleClick("f2",sender,x,y)

   d3dobject.OnOffToggleClicked(sender,"oot1","f1",
      function()
         -- on
         d3dobject.getComponent("lbl1","f2").text = "ESP Activated"

  asb = getAddress("GameAssembly.dll")
 local frff = readPointer(asb + 0x00B40DA4)
  frff = readPointer(frff + 0x034C)
  ffadr = readPointer(frff + 0x05C)
  gamemode = readBytes(ffadr + 0x218)
-- 5C


-- "GameAssembly.dll"+00B35D40 5C 0 2B4
 local team = readPointer(asb + 0x00B35D40)
  team = readPointer(team + 0x5C)
  teams = readPointer(team + 0x00)

--  time = readPointer(timerd + 0x178)
curteam = readBytes(teams + 0x2B4)



if curteam == 1 then
writeBytes(ffadr + 0x218,5) --gamemode
writeBytes(teams + 0x2B4,0) -- team 0
else
writeBytes(teams + 0x2B4,1) -- team 1
writeBytes(ffadr + 0x218,5) --gamemode
end
if gamemode == 2 then
writeBytes(teams + 0x2B4,0) -- team 0
writeBytes(ffadr + 0x218,5) --gamemode
end
      end,
      function()
         -- off
         d3dobject.getComponent("lbl1","f2").text = "ESP deactivated"
         if curteam == 1 then
writeBytes(teams + 0x2B4,1)
else
writeBytes(teams + 0x2B4,0)
end
writeBytes(ffadr + 0x218,gamemode) --restore gamemode
      end
   )

   d3dobject.OnOffToggleClicked(sender,"oot2","f1",
      function()
         -- on
         d3dobject.getComponent("lbl2","f2").text = "LBGTred Activated"
asb = getAddress("GameAssembly.dll")
  red = readPointer(asb + 0x00B24720)
  red = readPointer(red + 0x198)
  red = readPointer(red + 0xCC8)
  red = readPointer(red + 0x48)
 red = readPointer(red + 0x34)

lbgtime = createTimer(getMainForm())
lbgtime.Interval = 70
local upred = 0.16
local incr = 0
local decred = 0
lbgtime.OnTimer = function(lbgtime)--timer
maxref = readFloat(red + 0x3B0)
  if incr < 1 and maxref < 1 then
  incr = incr + 0.05
  upred = upred + 0.04
  writeFloat(red + 0x3B0,upred)
 elseif decred < 1 and upred > 0.16 then
decred = decred +0.05
upred = upred - 0.05
 writeFloat(red + 0x3B0,upred)
  else
upred = 0.16
 incr = 0
 decred = 0
 end
 end
      end,
      function()
         -- off
         d3dobject.getComponent("lbl2","f2").text = "LBGTred Deactivated"
lbgtime.destroy()
writeFloat(red + 0x3B0,0.16)
      end
   )
      d3dobject.OnOffToggleClicked(sender,"oot3","extra",
      function()
         -- on
         d3dobject.getComponent("lbl3","f2").text = "Activated"

         end,
      function()
         -- off
         d3dobject.getComponent("lbl3","f2").text = "Deactivated"

         end
         )

   d3dobject.buttonClicked(sender,"btn1","f1",function()
enmx = 32
enmy = 1
enmz = 32
aimbot(enmx, enmy, enmz)

      -- clicked
      d3dobject.getComponent("lbl1","f2").text = "Japrajah"
      d3dobject.getComponent("lbl2","f2").text = "Scub"
      d3dobject.getComponent("lbl3","f2").text = "aim test"
      d3dobject.getComponent("lbl4","f2").text = "aim test"
   end)

end


d3dobject.onkeydown = function(vkey,char)
   d3dobject.guihideshow(27,vkey) -- escape 
end
 
