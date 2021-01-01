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
if diy < 90 then
diy = - diy
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

function aimbot(enmx, enmy, enmz)
myposs(0xFC)
myx = info
--y
myposs(0x10C)
myy = info
--z
myposs(0x104)
myz = info
info = nil
getdistance(enmx, enmy, enmz, myx, myy, myz) -- 0 1 9 x y z врага
writedi(0x3C,dix)
writedi(0x40,diy)
end
