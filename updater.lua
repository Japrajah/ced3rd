-- nofing
OpenProcess("BLOCKPOST.exe")
function myposs(cord)
asb = getAddress("GameAssembly.dll")
local pos = readPointer(asb +0x00B2468C )
 pos = readPointer(pos + 0x480 )
 pos = readPointer(pos + 0x0 )
 local pos = readPointer(pos + 0x5C )
 info = readFloat(pos + cord)
-- posx = readPointer(posx + FC )
end

function getdistance(enmx, enmy, enmz, myx, myy, myz)
deltaX =  myx - enmx --delta x
deltaY =  myy - enmy
deltaZ =  myz - enmz
xzlength = math.sqrt((deltaX * deltaX) + (deltaZ * deltaZ))
         diy = math.atan2(deltaY, xzlength) * (-57.2957795)
         dix = math.atan2(deltaX, deltaZ) * (57.2957795)
if dix >= 0.0 then --aim normolaze
dix = dix + 180
else
dix = dix - 180
end
if diy > 90 then
diy = 90 - diy
end

end
function writedi(cord,di)
asb = getAddress("GameAssembly.dll")
local pos = readPointer(asb +0x00B2468C )
 pos = readPointer(pos + 0x480 )
 pos = readPointer(pos + 0x0 )
 local pos = readPointer(pos + 0x5C )
writeFloat(pos + cord,di)
-- posx = readPointer(posx + FC )
end
function enmposs(corda)
asb = getAddress("GameAssembly.dll")
local pos = readPointer(asb +0x00B35CA8 )
 pos = readPointer(pos + 0x3C )
 pos = readPointer(pos + 0x5C )
  pos = readPointer(pos + 0xC )
 local pos = readPointer(pos + 0x14 ) -- cord 50 54 58
 info = readFloat(pos + corda)
-- posx = readPointer(posx + FC )
end


function aimbot()
myposs(0xFC)
myx = info
--y
myposs(0x10C)
myy = info
--z
myposs(0x104)
myz = info
enmposs(0x50)
enmx = info
enmposs(0x54)
enmy = info
enmposs(0x58)
enmz = info
info = nil
getdistance(enmx, enmy, enmz, myx, myy, myz) -- 0 1 9 x y z врага
writedi(0x3C,dix)
writedi(0x40,diy)
end




-- lgbt red = 0x3B0 , green = 0x3B0, blue = 0x3B0

function lbgtmode(colors)
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
maxref = readFloat(red + colors)
  if incr < 1 and maxref < 1 then
  incr = incr + 0.05
  upred = upred + 0.04
  writeFloat(red + colors,upred)
 elseif decred < 1 and upred > 0.16 then
decred = decred +0.05
upred = upred - 0.05
 writeFloat(red + colors,upred)
  else
upred = 0.16
 incr = 0
 decred = 0
   end
  end
end
