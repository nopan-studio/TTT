-- 
local path = (...).."."
require (path.."inGame")
require (path.."inDead")
require (path.."inMenu")
require (path.."inShop")
require (path.."inSettings")
--
simp.state_current = inMenu
simp.state_curent_string = "inMenu"
--