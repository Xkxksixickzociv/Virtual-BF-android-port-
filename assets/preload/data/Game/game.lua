  -- Restart Button --
       --TAB--
   -- Exit Button --
       --ESC--	  
---------------------------
-- Still not a game engine
local isSleep = false
local hungryLvl = 100
local healthLvl = 100
local happyLvl = 100
local energyLvl = 100
local ballSpeed = 0
local isEating = false
local isPilling = false
local pillsHeld = false
local foodHeld = false
local dirtyLvl = 0

--custom character changes--

local Xposition = 430 --(Change this to make character x position left or right) ((430 is default))
local Yposition = 200 --(Change this to make character y position higher or lower) ((200 is default))

----------------------------
 
-- minigames --
local isGameSelect = false
--gd--
local cubeSpeed = 8
local cubeX = 0
local cubeGround = true
local isGD = false
--dodge-- 
local noteSpeed = 10
local noteR = 0
local bfPos = 1
local isDodger = false
--ping pong--
local ballX = 0
local ballR = 0
local ballSpeed = 2
local isPingPong = false
--local pingPongScore = 0

local songselect = 1
local worstSong = 0
local bgcolor = 1
local allowStart=false
function onStartCountdown()
runTimer('start', 0.5, 1) -- for better gameplay?
runTimer('song', 0.1, 1)
runTimer('blink', 3, 1)
runTimer('wHungry', 1, 1)
runTimer('wHealth', 6, 1)
runTimer('wHappy', 3, 1)
runTimer('wEnergy', 1.45, 1)


	if allowStart==false then
		setProperty('inCutscene', true)
		return Function_Stop;
	end
	return Function_Continue;
end -- funny
function onCreate()
   makeLuaSprite('bg', nil, 0, 0)
   makeGraphic('bg', 1280, 720, 'FFFFFF') -- you can change da color
   addLuaSprite('bg', true)
   setObjectCamera('bg', 'other')   

   makeLuaSprite('bf', 'VirtualPet/BFpet', Xposition, Yposition)
   addLuaSprite('bf', true)
   setObjectCamera('bf', 'other')   
   
   makeLuaSprite('switch', 'VirtualPet/items/lightSwitch', 200, 205)
   scaleObject('switch', 0.15, 0.15)
   addLuaSprite('switch', true)
   setObjectCamera('switch', 'other') 

   makeLuaSprite('plush', 'VirtualPet/items/plush', 970, 300)
   scaleObject('plush', 0.25, 0.25)
   addLuaSprite('plush', true)
   setProperty('plush.visible', false)
   setObjectCamera('plush', 'other')    
   
   makeAnimatedLuaSprite('bfEyes', 'VirtualPet/eyes', Xposition, Yposition)
   addAnimationByPrefix('bfEyes', 'normal', 'Normal', 1, true)
   addAnimationByPrefix('bfEyes', 'blink', 'Blink', 24, false) 
   addAnimationByPrefix('bfEyes', 'died', 'Died', 1, true) 
   addAnimationByPrefix('bfEyes', 'really', 'Really', 1, true) 
   addAnimationByPrefix('bfEyes', 'happy', 'Happy', 1, true)    
   addAnimationByPrefix('bfEyes', 'closed', 'Closed', 1, true)   
   addAnimationByPrefix('bfEyes', 'scared', 'Scared', 1, true) 
   addAnimationByPrefix('bfEyes', 'O', 'EyesO', 12, false)   
   addAnimationByPrefix('bfEyes', 'unnormal', 'unNormal', 1, true)   
   addAnimationByPrefix('bfEyes', 'tired', 'Tired', 1, true)   
   addAnimationByPrefix('bfEyes', 'unclosedSimple', 'unClosedSimple', 1, true)   
   addAnimationByPrefix('bfEyes', 'furious', 'Furious', 1, true) 
   addAnimationByPrefix('bfEyes', 'sexy', 'Sexy', 1, true)   
   addLuaSprite('bfEyes', true)
   setObjectCamera('bfEyes', 'other')  
   
   makeAnimatedLuaSprite('bfMouth', 'VirtualPet/mouth', Xposition, Yposition)
   addAnimationByPrefix('bfMouth', 'normal', 'Normal', 1, true) 
   addAnimationByPrefix('bfMouth', 'sad', 'Sad', 1, true) 
   addAnimationByPrefix('bfMouth', 'scared', 'Scared', 1, true) 
   addAnimationByPrefix('bfMouth', 'happy', 'Happy', 12, true)   
   addAnimationByPrefix('bfMouth', 'eat', 'Eat', 12, false) 
   addAnimationByPrefix('bfMouth', 'Eater', 'Eat', 36, true)    
   addAnimationByPrefix('bfMouth', 'smile', 'Smile', 1, true) 
   addAnimationByPrefix('bfMouth', 'uwu', 'uwu', 1, true)    
   addAnimationByPrefix('bfMouth', 'sleep', 'Sleep', 28, true) 
   addAnimationByPrefix('bfMouth', 'weird', 'Weird', 1, true)       
   addLuaSprite('bfMouth', true)
   setObjectCamera('bfMouth', 'other')  

   makeAnimatedLuaSprite('bfExpression', 'VirtualPet/emotions', Xposition, Yposition)
   addAnimationByPrefix('bfExpression', 'angry', 'Angry', 1, true) 
   addAnimationByPrefix('bfExpression', 'flushed', 'Flushed', 1, true) 
   addAnimationByPrefix('bfExpression', 'drops', 'Drops', 1, true) 
   addAnimationByPrefix('bfExpression', 'nothing', 'Nothing', 1, true)    
   addLuaSprite('bfExpression', true)
   setProperty('bfExpression.visible', false)
   setObjectCamera('bfExpression', 'other')  
   objectPlayAnimation('bfExpression', 'nothing', false)   

   makeLuaSprite('dirtyBF', 'VirtualPet/dirty', Xposition, Yposition)
   addLuaSprite('dirtyBF', true)
   setProperty('dirtyBF.alpha', 0)   
   setObjectCamera('dirtyBF', 'other')   
   
   makeLuaSprite('dark', nil, 0, 0)
   makeGraphic('dark', 1280, 720, '000000')
   setProperty('dark.alpha', 0)
   addLuaSprite('dark', true)
   setObjectCamera('dark', 'other') 
   
   makeLuaSprite('test', nil, 1208, 280)
   makeGraphic('test', 52, 62, '000000')
   setProperty('test.alpha', 0)   
   addLuaSprite('test', true)
   setObjectCamera('test', 'other')    

   makeLuaSprite('line1', nil, 0, 0)
   makeGraphic('line1', 1280, 120, '000000')
   setProperty('line1.alpha', 0.5)
   addLuaSprite('line1', true)
   setObjectCamera('line1', 'other')    
   makeLuaSprite('line2', nil, 0, 580)
   makeGraphic('line2', 1280, 140, '000000')
   setProperty('line2.alpha', 0.5)
   addLuaSprite('line2', true)
   setObjectCamera('line2', 'other')    
   
   makeLuaSprite('soap', 'VirtualPet/items/soap', 360, 590)
   scaleObject('soap', 0.225, 0.225)
   addLuaSprite('soap', true)
   setObjectCamera('soap', 'other')     

   makeLuaSprite('pills', 'VirtualPet/items/pills', 500, 600)
   scaleObject('pills', 0.25, 0.25)
   addLuaSprite('pills', true)
   setObjectCamera('pills', 'other')     
   
   makeLuaSprite('food', 'VirtualPet/items/food', 620, 600)
   scaleObject('food', 0.4, 0.4)
   addLuaSprite('food', true)
   setObjectCamera('food', 'other')   

   makeLuaSprite('gamer', 'VirtualPet/items/gamer', 820, 590)
   scaleObject('gamer', 0.3, 0.3)
   addLuaSprite('gamer', true)
   setObjectCamera('gamer', 'other')  
   
   makeLuaSprite('bgchange', 'VirtualPet/BGselect', 0, 280)
   scaleObject('bgchange', 1, 1)
   addLuaSprite('bgchange', true)
   setObjectCamera('bgchange', 'other')    
   
   makeLuaSprite('songchange', 'VirtualPet/SONGselect', 1165, 280)
   scaleObject('songchange', 1, 1)
   addLuaSprite('songchange', true)
   setObjectCamera('songchange', 'other')       

   makeLuaSprite('Hungry', 'VirtualPet/box/Hungry', 410, 6)
   scaleObject('Hungry', 0.35, 0.35)
   addLuaSprite('Hungry', true)
   setObjectCamera('Hungry', 'other')     
   makeLuaSprite('Health', 'VirtualPet/box/Health', 520, 6)
   scaleObject('Health', 0.35, 0.35)
   addLuaSprite('Health', true)
   setObjectCamera('Health', 'other')     
   makeLuaSprite('Happy', 'VirtualPet/box/Happy', 630, 6)
   scaleObject('Happy', 0.35, 0.35)
   addLuaSprite('Happy', true)
   setObjectCamera('Happy', 'other') 
   makeLuaSprite('Energy', 'VirtualPet/box/Energy', 740, 6)
   scaleObject('Energy', 0.35, 0.35)
   addLuaSprite('Energy', true)
   setObjectCamera('Energy', 'other') 

   makeLuaSprite('ball', 'VirtualPet/PingPong/ball', 240, 320)
   scaleObject('ball', 0.15, 0.15)
   setProperty('ball.visible', false)
   addLuaSprite('ball', true)
   setObjectCamera('ball', 'other')   

   makeLuaSprite('stick', 'VirtualPet/PingPong/stick', 980, 320)
   scaleObject('stick', 0.35, 0.35)
   setProperty('stick.visible', false)
   addLuaSprite('stick', true)
   setObjectCamera('stick', 'other')  
   
   makeLuaSprite('spike', 'VirtualPet/GeometryDash/spike', getRandomInt(440,880), 503)
   scaleObject('spike', 0.15, 0.15)
   setProperty('spike.visible', true)
   addLuaSprite('spike', true)
   setObjectCamera('spike', 'other')   

   makeLuaSprite('cube', 'VirtualPet/GeometryDash/cube', 120, 503)
   scaleObject('cube', 0.15, 0.15)
   setProperty('cube.visible', true)
   addLuaSprite('cube', true)
   setObjectCamera('cube', 'other')   
   
   makeLuaSprite('playerIcon', 'VirtualPet/Dodge/playerIcon', 120, 205)
   scaleObject('playerIcon', 1, 1)
   setProperty('playerIcon.visible', true)
   addLuaSprite('playerIcon', true)
   setObjectCamera('playerIcon', 'other')      
   
   makeLuaSprite('upDodge', 'VirtualPet/Dodge/upDodge', 1280, 405)
   scaleObject('upDodge', 0.75, 0.75)
   setProperty('upDodge.visible', true)
   addLuaSprite('upDodge', true)
   setObjectCamera('upDodge', 'other')    
   makeLuaSprite('downDodge', 'VirtualPet/Dodge/downDodge', 1280, 205)
   scaleObject('downDodge', 0.75, 0.75)
   setProperty('downDodge.visible', true)
   addLuaSprite('downDodge', true)
   setObjectCamera('downDodge', 'other')       

   makeLuaSprite('gameSelect', nil, 300, 120)
   makeGraphic('gameSelect', 640, 460, 'FFFFFF')
   setProperty('gameSelect.alpha', 0)
   addLuaSprite('gameSelect', true)
   setObjectCamera('gameSelect', 'other') 
   makeLuaSprite('pingIcon', 'VirtualPet/Visual/pingpongIcon', 320, 280)
   scaleObject('pingIcon', 0.25, 0.25)
   setProperty('pingIcon.visible', false)   
   addLuaSprite('pingIcon', true)
   setObjectCamera('pingIcon', 'other')    
   makeLuaSprite('gdIcon', 'VirtualPet/Visual/gdIcon', 770, 280)
   scaleObject('gdIcon', 0.25, 0.25)
   setProperty('gdIcon.visible', false)   
   addLuaSprite('gdIcon', true)
   setObjectCamera('gdIcon', 'other')
   makeLuaSprite('dodgeIcon', 'VirtualPet/Visual/dodgeIcon', 555, 280)
   scaleObject('dodgeIcon', 0.25, 0.25)
   setProperty('dodgeIcon.visible', false)   
   addLuaSprite('dodgeIcon', true)
   setObjectCamera('dodgeIcon', 'other')      

   makeLuaText('esc', 'Press Esc to leave \n      Press Tab to restart song', 400, -140, 700)
   setTextSize('esc', 10)
   setObjectCamera('esc', 'other') 
   addLuaText('esc', true)   
   
end
function onUpdate()
setPropertyFromClass('flixel.FlxG', 'mouse.visible', true)
soapHeld = false

	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ESCAPE') then
	   endSong()
	end		
	if keyJustPressed('back') then
	   endSong()
	end
	if keyJustPressed('accept') then
	   loadSong(songName)
	end	
	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.TAB') then
	   loadSong(songName)
	end		
	  	

  if isPingPong == false and isGD == false and isDodger == false then	
	if (getMouseX('camHUD') > 43 and getMouseX('camHUD') < 92) and (getMouseY('camHUD') > 280 and getMouseY('camHUD') < 340 and mouseReleased('left')) then
	   bgcolor = bgcolor - 1   
	end
	if (getMouseX('camHUD') > 43 and getMouseX('camHUD') < 92) and (getMouseY('camHUD') > 380 and getMouseY('camHUD') < 440 and mouseReleased('left')) then
	   bgcolor = bgcolor + 1   
	end	
  end	
	

    if bgcolor < 1 then
      bgcolor = 1
    end
    if bgcolor > 12 then
      bgcolor = 12
    end	  	
	
	if bgcolor == 1 then
	   setProperty('bg.color', getColorFromHex('f54242'))
	elseif bgcolor == 2 then
	   setProperty('bg.color', getColorFromHex('54f542'))
	elseif bgcolor == 3 then
	   setProperty('bg.color', getColorFromHex('f5e642'))
	elseif bgcolor == 4 then
	   setProperty('bg.color', getColorFromHex('42c5f5'))
	elseif bgcolor == 5 then
	   setProperty('bg.color', getColorFromHex('a136ff'))	
	elseif bgcolor == 6 then
	   setProperty('bg.color', getColorFromHex('ec42f5'))	
	elseif bgcolor == 7 then
	   setProperty('bg.color', getColorFromHex('591515'))	
	elseif bgcolor == 8 then
	   setProperty('bg.color', getColorFromHex('1c5915'))	
	elseif bgcolor == 9 then
	   setProperty('bg.color', getColorFromHex('595615'))	
	elseif bgcolor == 10 then
	   setProperty('bg.color', getColorFromHex('155259'))	
	elseif bgcolor == 11 then
	   setProperty('bg.color', getColorFromHex('4a1775'))	
	elseif bgcolor == 12 then
	   setProperty('bg.color', getColorFromHex('59154c'))		   
	end
	
    if songselect < 1 then
      songselect = 11
    end
    if songselect > 11 and songselect < 666 then
      songselect = 1
    end	  	
	
  if isPingPong == false and isGD == false and isDodger == false then		
	if (getMouseX('camHUD') > 1208 and getMouseX('camHUD') < 1252) and (getMouseY('camHUD') > 280 and getMouseY('camHUD') < 340 and mouseReleased('left')) then
	   songselect = songselect - 1 
	   runTimer('song', 0.2, 1)	   	   
	end
	if (getMouseX('camHUD') > 1208 and getMouseX('camHUD') < 1252) and (getMouseY('camHUD') > 380 and getMouseY('camHUD') < 440 and mouseReleased('left')) then
	   songselect = songselect + 1
	   worstSong = worstSong + 1
	   runTimer('song', 0.2, 1)	   
	end			
   end	
	
	if worstSong == 666 then
	  songselect = 666
	end
	
    setProperty('dirtyBF.alpha', dirtyLvl / 75)   	
		

    -- if hungryLvl == 0 and healthLvl == 0 and happyLvl == 0 and energyLvl == 0 then
	  -- Herobrine()
	--end
	
	if hungryLvl > 75 then 
	   setProperty('Hungry.color', getColorFromHex('00ff00'))
	 elseif hungryLvl <= 75 and hungryLvl >= 50 then
	   setProperty('Hungry.color', getColorFromHex('ff7b00'))	
	 elseif hungryLvl < 50 and hungryLvl >= 15 then
	   setProperty('Hungry.color', getColorFromHex('ff0000'))		   
	 elseif hungryLvl < 15 and hungryLvl >= 1 then
	   setProperty('Hungry.color', getColorFromHex('780000'))	
	 elseif hungryLvl == 0 then
	   setProperty('Hungry.color', getColorFromHex('323232'))		   
	end
	if happyLvl > 75 then 
	   setProperty('Happy.color', getColorFromHex('00ff00'))
	 elseif happyLvl <= 75 and happyLvl >= 50 then
	   setProperty('Happy.color', getColorFromHex('ff7b00'))	
	 elseif happyLvl < 50 and happyLvl >= 15 then
	   setProperty('Happy.color', getColorFromHex('ff0000'))		   
	 elseif happyLvl < 15 and happyLvl >= 1 then
	   setProperty('Happy.color', getColorFromHex('780000'))	
	 elseif happyLvl == 0 then
	   setProperty('Happy.color', getColorFromHex('323232'))		   
	end
	if healthLvl > 75 then 
	   setProperty('Health.color', getColorFromHex('00ff00'))
	 elseif healthLvl <= 75 and healthLvl >= 50 then
	   setProperty('Health.color', getColorFromHex('ff7b00'))	
	 elseif healthLvl < 50 and healthLvl >= 15 then
	   setProperty('Health.color', getColorFromHex('ff0000'))		   
	 elseif healthLvl < 15 and healthLvl >= 1 then
	   setProperty('Health.color', getColorFromHex('780000'))	
	 elseif healthLvl == 0 then
	   setProperty('Health.color', getColorFromHex('323232'))		   
	end
	if energyLvl > 75 then 
	   setProperty('Energy.color', getColorFromHex('00ff00'))
	 elseif energyLvl <= 75 and energyLvl >= 50 then
	   setProperty('Energy.color', getColorFromHex('ff7b00'))	
	 elseif energyLvl < 50 and energyLvl >= 15 then
	   setProperty('Energy.color', getColorFromHex('ff0000'))		   
	 elseif energyLvl < 15 and energyLvl >= 1 then
	   setProperty('Energy.color', getColorFromHex('780000'))	
	 elseif energyLvl == 0 then
	   setProperty('Energy.color', getColorFromHex('323232'))		   
	end	
	
	if hungryLvl < 0 then
	 hungryLvl = 0 
    end
	if happyLvl < 0 then
	 happyLvl = 0 
    end
	if healthLvl < 0 then
	 healthLvl = 0 
    end
	if energyLvl < 0 then
	 energyLvl = 0 
    end	
	if dirtyLvl < 0 then
	 dirtyLvl = 0 
    end		
	if dirtyLvl > 100 then
	 dirtyLvl = 100 
    end		    
	
  if isSleep == false and isEating == false and isPilling == false and isPingPong == false then	
	if hungryLvl < 15 then
	  setProperty('bfExpression.visible', true)
      objectPlayAnimation('bfExpression', 'angry', false)	
      objectPlayAnimation('bfMouth', 'eat', true)
      objectPlayAnimation('bfEyes', 'really', false)	  
	end	
			
	if energyLvl < 15 and isSleep == false then
      objectPlayAnimation('bfMouth', 'smile', true)
      objectPlayAnimation('bfEyes', 'unclosedSimple', false)	  
	end			
	
	if happyLvl <= 35 then
      objectPlayAnimation('bfMouth', 'scared', false)
      objectPlayAnimation('bfEyes', 'unnormal', false)	  
	end	
	if happyLvl < 5 then
	  setProperty('bfExpression.visible', true)
      objectPlayAnimation('bfExpression', 'angry', false)		
      objectPlayAnimation('bfMouth', 'scared', false)
      objectPlayAnimation('bfEyes', 'blink', false)	  
	end		
	
	if healthLvl < 50 and healthLvl > 5 then
	  setProperty('bfExpression.visible', true)
      objectPlayAnimation('bfExpression', 'drops', false)	
      objectPlayAnimation('bfMouth', 'sad', false)
	end
	if healthLvl <= 5 then
	  setProperty('bfExpression.visible', true)
      objectPlayAnimation('bfExpression', 'drops', false)	
      objectPlayAnimation('bfMouth', 'weird', false)
      objectPlayAnimation('bfEyes', 'died', false)	  
	end		
   end	
	
    if getProperty('bfEyes.animation.curAnim.finished') and getProperty('bfEyes.animation.curAnim.name') == 'blink' then
	 if isPingPong == false and isDodger == false and isGD == false then
      objectPlayAnimation('bfEyes', 'normal', false)	  
     end	  
      runTimer('blink', 3, 1)	  
    end  
  if isPingPong == false and isGD == false and isDodger == false then
    if isSleep == false and healthLvl > 5 and (getMouseX('camHUD') > getProperty('switch.x') and getMouseX('camHUD') < getProperty('switch.x') + getProperty('switch.width')) and (getMouseY('camHUD') > getProperty('switch.y') and getMouseY('camHUD') < getProperty('switch.y') + getProperty('switch.height') and mouseClicked('left')) then
      setProperty('dark.alpha', 0.6)	   
	  setProperty('switch.flipY', true)
	  
	  if energyLvl <= 75 then
      objectPlayAnimation('bfEyes', 'closed', false)	 
      objectPlayAnimation('bfMouth', 'sleep', false)
	  runTimer('bfSleep', 0.1, 1)	  
       elseif energyLvl > 75 then 
      objectPlayAnimation('bfEyes', 'O', false)	 
      objectPlayAnimation('bfMouth', 'scared', false)	
      end	  
	  
	  isSleep = true
    elseif isSleep == true and (getMouseX('camHUD') > getProperty('switch.x') and getMouseX('camHUD') < getProperty('switch.x') + getProperty('switch.width')) and (getMouseY('camHUD') > getProperty('switch.y') and getMouseY('camHUD') < getProperty('switch.y') + getProperty('switch.height') and mouseClicked('left')) then
      setProperty('dark.alpha', 0)	   
	  setProperty('switch.flipY', false)	
      objectPlayAnimation('bfEyes', 'normal', false)
      objectPlayAnimation('bfMouth', 'normal', false)
      objectPlayAnimation('bfExpression', 'nothing', false)
      setProperty('bfExpression.visible', false)	  	  
	  isSleep = false	  
	end	
	
	if soapHeld == false and (getMouseX('camHUD') > getProperty('soap.x') and getMouseX('camHUD') < getProperty('soap.x') + getProperty('soap.width')) and (getMouseY('camHUD') > getProperty('soap.y') and getMouseY('camHUD') < getProperty('soap.y') + getProperty('soap.height') and mousePressed('left')) then
	   soapHeld = true	      
	   cancelTimer('normal')
    else if (getMouseX('camHUD') > getProperty('soap.x') and getMouseX('camHUD') < getProperty('soap.x') + getProperty('soap.width')) and (getMouseY('camHUD') > getProperty('soap.y') and getMouseY('camHUD') < getProperty('soap.y') + getProperty('soap.height') and mouseReleased('left')) then
	   soapHeld = false
	   runTimer('normal', 2, 1)
	end
	end
	if isSleep == false and (getMouseX('camHUD') > getProperty('soap.x') and getMouseX('camHUD') < getProperty('soap.x') + getProperty('soap.width')) and (getMouseY('camHUD') > getProperty('soap.y') and getMouseY('camHUD') < getProperty('soap.y') + getProperty('soap.height') and mouseClicked('left')) then	
	   runTimer('Soap!', 0.1, 1)
	end
	if isSleep == false and soapHeld == true and getProperty('soap.x') + getProperty('soap.width') > getProperty('bf.x') and getProperty('soap.x') < getProperty('bf.x') + getProperty('bf.width') and getProperty('soap.y') + getProperty('soap.height') > getProperty('bf.y') and getProperty('soap.y') < getProperty('bf.y') + getProperty('bf.height') then   
       dirtyLvl = dirtyLvl - 0.25
       objectPlayAnimation('bfEyes', 'happy', true) 		  
	end	
	
	if soapHeld == true then
        setProperty('soap.x', getMouseX('camHUD')- 45)
        setProperty('soap.y', getMouseY('camHUD')- 45)			
	end		
	
	if foodHeld == false and (getMouseX('camHUD') > getProperty('food.x') and getMouseX('camHUD') < getProperty('food.x') + getProperty('food.width')) and (getMouseY('camHUD') > getProperty('food.y') and getMouseY('camHUD') < getProperty('food.y') + getProperty('food.height') and mousePressed('left')) then
	   foodHeld = true	      
	   cancelTimer('normal')
    else if (getMouseX('camHUD') > getProperty('food.x') and getMouseX('camHUD') < getProperty('food.x') + getProperty('food.width')) and (getMouseY('camHUD') > getProperty('food.y') and getMouseY('camHUD') < getProperty('food.y') + getProperty('food.height') and mouseReleased('left')) then
	   foodHeld = false
	   runTimer('normal', 2, 1)
	   if isSleep == false and getProperty('food.x') > getProperty('bf.x') and getProperty('food.x') < getProperty('bf.x') + 200 and getProperty('food.y') > getProperty('bf.y') and getProperty('food.y') < getProperty('bf.y') + 200 and mouseReleased('left') then
        if hungryLvl <= 85 and healthLvl > 5 then	   
         runTimer('FOODEATER', 0.01, 1)
		 setProperty('food.visible', false)
		end 
	   end
	end
	end
	if isSleep == false and (getMouseX('camHUD') > getProperty('food.x') and getMouseX('camHUD') < getProperty('food.x') + getProperty('food.width')) and (getMouseY('camHUD') > getProperty('food.y') and getMouseY('camHUD') < getProperty('food.y') + getProperty('food.height') and mouseClicked('left')) then	
	   runTimer('Food!', 0.1, 1)
	end
	
	if foodHeld == true then
        setProperty('food.x', getMouseX('camHUD')- 45)
        setProperty('food.y', getMouseY('camHUD')- 45)			
	end	
	
	if pillsHeld == false and (getMouseX('camHUD') > getProperty('pills.x') and getMouseX('camHUD') < getProperty('pills.x') + getProperty('pills.width')) and (getMouseY('camHUD') > getProperty('pills.y') and getMouseY('camHUD') < getProperty('pills.y') + getProperty('pills.height') and mousePressed('left')) then
	   pillsHeld = true	      
	   cancelTimer('normal')
    else if (getMouseX('camHUD') > getProperty('pills.x') and getMouseX('camHUD') < getProperty('pills.x') + getProperty('pills.width')) and (getMouseY('camHUD') > getProperty('pills.y') and getMouseY('camHUD') < getProperty('pills.y') + getProperty('pills.height') and mouseReleased('left')) then
	   pillsHeld = false
	   runTimer('normal', 2, 1)
	   if isSleep == false and getProperty('pills.x') > getProperty('bf.x') and getProperty('pills.x') < getProperty('bf.x') + 200 and getProperty('pills.y') > getProperty('bf.y') and getProperty('pills.y') < getProperty('pills.y') + 200 and mouseReleased('left') then
        if healthLvl <= 85 then	   
         runTimer('PillsHum', 0.01, 1)
		 setProperty('pills.visible', false)
		end 
	   end
	end
	end
	if isSleep == false and (getMouseX('camHUD') > getProperty('pills.x') and getMouseX('camHUD') < getProperty('pills.x') + getProperty('pills.width')) and (getMouseY('camHUD') > getProperty('pills.y') and getMouseY('camHUD') < getProperty('pills.y') + getProperty('pills.height') and mouseClicked('left')) then	
	   runTimer('pills!', 0.1, 1)
	end	
	
	if pillsHeld == true then
        setProperty('pills.x', getMouseX('camHUD')- 45)
        setProperty('pills.y', getMouseY('camHUD')- 45)			
	end
  end	
	
	if isGameSelect == false and isPingPong == false and isDodger == false and isGD == false and isSleep == false and energyLvl > 35 and (getMouseX('camHUD') > getProperty('gamer.x') and getMouseX('camHUD') < getProperty('gamer.x') + getProperty('gamer.width')) and (getMouseY('camHUD') > getProperty('gamer.y') and getMouseY('camHUD') < getProperty('gamer.y') + getProperty('gamer.height') and mouseClicked('left')) then
	   isGameSelect = true
    end	
	
	if isGameSelect == false then
	  setProperty('gameSelect.alpha', 0)
	  setProperty('gdIcon.visible', false)
	  setProperty('dodgeIcon.visible', false)		  
	  setProperty('pingIcon.visible', false)  
	end  
	if isGameSelect == true then
	  setProperty('gameSelect.alpha', 0.5)
	  setProperty('gdIcon.visible', true)
	  setProperty('dodgeIcon.visible', true)	  
	  setProperty('pingIcon.visible', true)	 	  
	  if (getMouseX('camHUD') > getProperty('pingIcon.x') and getMouseX('camHUD') < getProperty('pingIcon.x') + getProperty('pingIcon.width')) and (getMouseY('camHUD') > getProperty('pingIcon.y') and getMouseY('camHUD') < getProperty('pingIcon.y') + getProperty('pingIcon.height') and mouseReleased('left')) then
	   isGameSelect = false
	   isPingPong = true
	   runTimer('hapiness', 1, 1)
	   runTimer('BallRandom', 1, 1)
      end	
	  if (getMouseX('camHUD') > getProperty('gdIcon.x') and getMouseX('camHUD') < getProperty('gdIcon.x') + getProperty('gdIcon.width')) and (getMouseY('camHUD') > getProperty('gdIcon.y') and getMouseY('camHUD') < getProperty('gdIcon.y') + getProperty('gdIcon.height') and mouseReleased('left')) then
	   isGameSelect = false
	   isGD = true
	   runTimer('hapiness', 1, 1)
	   runTimer('moveCube', 1, 1)	   
      end	
	  if (getMouseX('camHUD') > getProperty('dodgeIcon.x') and getMouseX('camHUD') < getProperty('dodgeIcon.x') + getProperty('dodgeIcon.width')) and (getMouseY('camHUD') > getProperty('dodgeIcon.y') and getMouseY('camHUD') < getProperty('dodgeIcon.y') + getProperty('dodgeIcon.height') and mouseReleased('left')) then
	   isGameSelect = false
	   isDodger = true
	   runTimer('hapiness', 1, 1)
	   runTimer('moveNotes', 1, 1)	   
      end		  
	end
	
	if isPingPong == false then
	  setProperty('ball.visible', false)
	   setProperty('stick.visible', false)	 
	    setProperty('stick.y', 360)
	     setProperty('ball.x', 240)
	      setProperty('ball.y', 360)
           ballR = 0
            ballX = 0  				
	end
	if isPingPong == true then
	  setProperty('ball.visible', true)
	   setProperty('stick.visible', true)
	    setProperty('bg.color', getColorFromHex('454545'))	
	     setProperty('stick.y', getMouseY('camOther')- 35)		   
	end
	
	
	if ballR == 1 then
	   setProperty('ball.y', getProperty('ball.y')- ballSpeed)	   
	elseif ballR == 2 then
	   setProperty('ball.y', getProperty('ball.y')+ ballSpeed)	 	   
    end
	
	if ballX == 1 then
       setProperty('ball.x', getProperty('ball.x')+ ballSpeed)
    elseif ballX == 2 then
       setProperty('ball.x', getProperty('ball.x')- ballSpeed)		
    end	   
	
	if getProperty('ball.y') + getProperty('ball.height') >= 580 then
	   ballR = 1
	   ballSpeed = ballSpeed + 0.1
	   playSound('tap', 1)	  
	end
	if getProperty('ball.y') <= 120 then
	   ballR = 2
	   ballSpeed = ballSpeed + 0.1	   
	   playSound('tap', 1)	  
	end	
	
	if getProperty('ball.x') <= 0 then
       ballX = 1	   
	   ballSpeed = ballSpeed + 0.1	
       playSound('tap', 1)	  	   
	end	
	
	if getProperty('ball.x') + getProperty('ball.width') >= getProperty('stick.x') and getProperty('ball.x') + getProperty('ball.width') <= getProperty('stick.x') + getProperty('stick.width') and getProperty('ball.y') + getProperty('ball.height') >= getProperty('stick.y') and getProperty('ball.y') + getProperty('ball.height') <= getProperty('stick.y') + getProperty('stick.height') then
       ballX = 2	   
	   ballSpeed = ballSpeed + 0.1	
       playSound('tap', 1)	   
	end
	
	if getProperty('ball.x') > 1280 then
       isPingPong = false   
	  if ballSpeed > 3 then 
	   ballSpeed = ballSpeed / 2
	  end  
       runTimer('normal', 0.5, 1)	 
	end	


    if isGD == false then
	   cubeSpeed = 8
	   cubeGround = true
	   cubeX = 1
	   setProperty('cube.angle', 0)
	   setProperty('cube.x', 120)
       setProperty('cube.visible', false)   
       setProperty('spike.visible', false) 		
	end
	
	if isGD == true then
	  setProperty('spike.visible', true)
	  setProperty('cube.visible', true)
	  if cubeGround == true and mouseClicked('left') then
	   cubeGround = false
	   doTweenY('jump', 'cube', getProperty('cube.y')- 125, 0.25, 'cubeOut')
	    if cubeX == 1 or cubeX == 0 then
		 doTweenAngle('jumpA1', 'cube', getProperty('cube.angle')+ 180, 0.55, 'easeOutIn')
	    elseif cubeX == 2 then
		 doTweenAngle('jumpA2', 'cube', getProperty('cube.angle')- 180, 0.55, 'easeOutIn')	
        end		 
	  end
	end
	
	if cubeX == 1 then
	  setProperty('cube.x', getProperty('cube.x')+ cubeSpeed)
	elseif cubeX == 2 then 
	  setProperty('cube.x', getProperty('cube.x')- cubeSpeed)	
	end
	
	if getProperty('cube.x') + getProperty('cube.width') > 1280 then
	 cubeX = 2
	 cubeSpeed = cubeSpeed + 0.1	
     setProperty('spike.x', getRandomInt(440,880))	 
	end
	if getProperty('cube.x') < 0 then
	 cubeX = 1
	 cubeSpeed = cubeSpeed + 0.1
     setProperty('spike.x', getRandomInt(440,880))	 	 
	end
	
	if getProperty('cube.x') + getProperty('cube.width') > getProperty('spike.x') + 10 and getProperty('cube.x') < getProperty('spike.x') + getProperty('spike.width') - 10 and getProperty('cube.y') + getProperty('cube.height') > getProperty('spike.y') + 10 and getProperty('cube.y') < getProperty('spike.y') + getProperty('spike.height') then
	  isGD = false
       runTimer('normal', 0.5, 1)		  
	end

    if isDodger == false then
       setProperty('playerIcon.visible', false)   
       setProperty('downDodge.visible', false) 	
       setProperty('upDodge.visible', false) 		    
	   setProperty('upDodge.x', 1280)	 
	   setProperty('downDodge.x', 1280)	 
       bfPos = 0
       noteSpeed = 10
       noteR = 0
       cancelTimer('moveNotes')	   
	end		
    if isDodger == true then
       setProperty('playerIcon.visible', true)   
       setProperty('downDodge.visible', true) 	
       setProperty('upDodge.visible', true) 		   
       bfPos = 1
	  if mousePressed('left') then
	    bfPos = 2
	  end	  
	end	
	
	if bfPos == 1 then
	 setProperty('playerIcon.y', 405)
	end 
	if bfPos == 2 then
	 setProperty('playerIcon.y', 205)	
    end	

    if noteR == 1 then
      setProperty('downDodge.x', getProperty('downDodge.x')- noteSpeed)	
    elseif noteR == 2 then
      setProperty('upDodge.x', getProperty('upDodge.x')- noteSpeed)		  
	end
	
	if getProperty('downDodge.x') < -100 then
	  noteR = 0
	  setProperty('downDodge.x', 1280)
	  runTimer('moveNotes', 0.1, 1)
	  noteSpeed = noteSpeed + 0.5
	end
	if getProperty('upDodge.x') < -100 then
	  noteR = 0	
	  setProperty('upDodge.x', 1280)
	  runTimer('moveNotes', 0.1, 1)
	  noteSpeed = noteSpeed + 0.5  
	end	
	
	if getProperty('playerIcon.x') + getProperty('playerIcon.width') > getProperty('downDodge.x') and getProperty('playerIcon.x') + getProperty('playerIcon.width') < getProperty('downDodge.x') + getProperty('downDodge.width') and getProperty('playerIcon.y') == 205 then
	  isDodger = false
      runTimer('normal', 0.5, 1)		  
	end
	if getProperty('playerIcon.x') + getProperty('playerIcon.width') > getProperty('upDodge.x') and getProperty('playerIcon.x') + getProperty('playerIcon.width') < getProperty('upDodge.x') + getProperty('upDodge.width') and getProperty('playerIcon.y') == 405 then
	  isDodger = false
      runTimer('normal', 0.5, 1)		  
	end	
end
function onTimerCompleted(tag)
 if tag == 'song' then
  stopSound('song1')
  stopSound('song2')
  stopSound('song3')  
  stopSound('song4')
  stopSound('song5')
  stopSound('song6')
  stopSound('song7')	
  stopSound('song8')
  stopSound('song9')
  stopSound('song10')
  stopSound('song11')
  stopSound('song666')
	if songselect == 1 then
	   playSound('blammed', 0.5, 'song1')
	elseif songselect == 2 then
	   playSound('boxing-match', 1, 'song2')
	elseif songselect == 3 then
	   playSound('dadbattle', 0.5, 'song3')
	elseif songselect == 4 then
	   playSound('eggnog', 0.5, 'song4')
	elseif songselect == 5 then
	   playSound('high', 0.5, 'song5')	
	elseif songselect == 6 then
	   playSound('insanity', 0.5, 'song6')	
	elseif songselect == 7 then
	   playSound('milk', 0.7, 'song7')
	elseif songselect == 8 then
	   playSound('revenge', 1, 'song8')
	elseif songselect == 9 then
	   playSound('roses', 1, 'song9')
	elseif songselect == 10 then
	   playSound('south', 0.5, 'song10')	
	elseif songselect == 11 then
	   playSound('target-practice', 1, 'song11')	
	elseif songselect == 666 then
	   playSound('stopDude', 0.4, 'song666')		   
	end	 
 end
 
  if tag == 'blink' then
    runTimer('blink', 3, 1)
   if isSleep == false and isPilling == false and isEating == false and soapHeld == false and foodHeld == false and pillsHeld == false then
      objectPlayAnimation('bfEyes', 'blink', false)
   end
  end
    if tag == 'bfSleep' then  
	 if isSleep == true then
      energyLvl = energyLvl + 2
	  runTimer('bfSleep', 0.4, 1)
	 end 
    end	  

    if tag == 'wEnergy' then
       energyLvl = energyLvl - 1 
	  runTimer('wEnergy', 1.45, 1)
    end	
    if tag == 'wHappy' then
       happyLvl = happyLvl - 1 
	  runTimer('wHappy', 3, 1)
    end	
    if tag == 'wHungry' then
       hungryLvl = hungryLvl - 1 
	  runTimer('wHungry', 1, 1)
    end	
    if tag == 'wHealth' then
	 if dirtyLvl < 25 then
       healthLvl = healthLvl - 1
     end	   
	 if dirtyLvl >= 25 and dirtyLvl < 50 then
       healthLvl = healthLvl - 2
     end	
	 if dirtyLvl >= 50 and dirtyLvl < 100 then
       healthLvl = healthLvl - 2.5
     end	
	 if dirtyLvl == 100 then
       healthLvl = healthLvl - 5
     end	   	 
	  runTimer('wHealth', 6, 1)
    end		
  
    if tag == 'Food!' then  
	if hungryLvl > 85 then
      objectPlayAnimation('bfEyes', 'really', false)	 
      objectPlayAnimation('bfMouth', 'scared', false)	
      objectPlayAnimation('bfExpression', 'angry', false)	
      setProperty('bfExpression.visible', true)	  
	end  	
	if hungryLvl <= 85 then
      objectPlayAnimation('bfMouth', 'eat', false) 
	end
	end
    if tag == 'pills!' then  
	if healthLvl > 85 then
      objectPlayAnimation('bfEyes', 'O', false)	 
      objectPlayAnimation('bfMouth', 'weird', false)	
      objectPlayAnimation('bfExpression', 'flushed', false)	
      setProperty('bfExpression.visible', true)	  
	end  	
	if healthLvl <= 85 then
      objectPlayAnimation('bfEyes', 'scared', false) 	
      objectPlayAnimation('bfMouth', 'scared', false) 
	end	
    end	 
    if tag == 'Soap!' then  
      objectPlayAnimation('bfEyes', 'normal', false)	 
      objectPlayAnimation('bfMouth', 'smile', false)	
    end	 	
	if tag == 'FOODEATER' then
	   hungryLvl = hungryLvl + 15
	   healthLvl = healthLvl - 2
	   dirtyLvl = dirtyLvl + 5
	   playSound('eat', 2)	   
	   isEating = true
          objectPlayAnimation('bfMouth', 'Eater', true)
          objectPlayAnimation('bfEyes', 'happy', true)	
		  runTimer('normal', 1.75, 1)
    end		
	if tag == 'PillsHum' then
	   healthLvl = healthLvl + 35
	   happyLvl = happyLvl - 10
	   playSound('pills', 1)
	   isPilling = true
          objectPlayAnimation('bfMouth', 'sad', true)
          objectPlayAnimation('bfEyes', 'scared', true)	
		  runTimer('normal', 2, 1)
    end			
	if tag == 'normal' then
	 if isSleep == false then
          objectPlayAnimation('bfMouth', 'normal', true)
          objectPlayAnimation('bfEyes', 'normal', true)	
	 end	  
	 
          setProperty('soap.x', 360)	
          setProperty('soap.y', 590)	 
          setProperty('food.x', 620)	
          setProperty('food.y', 600)			  
		 setProperty('food.visible', true)	
          setProperty('pills.x', 500)	
          setProperty('pills.y', 600)			  
		 setProperty('pills.visible', true)			 
      setProperty('bfExpression.visible', false)	 		 
       isEating = false	
	   isPilling = false	   
	end	
	if tag == 'hapiness' then
	 if isPingPong == true or isGD == true or isDodger == true then
	   happyLvl = happyLvl + 2	
	   dirtyLvl = dirtyLvl + 0.25
       objectPlayAnimation('bfMouth', 'uwu', true)
       objectPlayAnimation('bfEyes', 'unnormal', true)		   
       runTimer('hapiness', 1, 1)		  
     end	   
    end		
	
	if tag == 'BallRandom' then
	   ballR = getRandomInt(1,2)
       ballX = getRandomInt(1,2)  
	end
	
	if tag == 'moveCube' then
      cubeX = 1
	end
	
	if tag == 'moveNotes' then
	  noteR = getRandomInt(1,2)
	end
end	

function onSoundFinished(tag)
 if tag == 'song1' then
   songselect = songselect + 1
   runTimer('song', 0.5, 1)
 end
 if tag == 'song2' then
   songselect = songselect + 1
   runTimer('song', 0.5, 1)
 end
 if tag == 'song3' then
   songselect = songselect + 1
   runTimer('song', 0.5, 1)
 end
 if tag == 'song4' then
   songselect = songselect + 1
   runTimer('song', 0.5, 1)
 end
 if tag == 'song5' then
   songselect = songselect + 1
   runTimer('song', 0.5, 1)
 end
 if tag == 'song6' then
   songselect = songselect + 1
   runTimer('song', 0.5, 1)
 end
 if tag == 'song7' then
   songselect = songselect + 1
   runTimer('song', 0.5, 1)
 end 
 if tag == 'song8' then
   songselect = songselect + 1
   runTimer('song', 0.5, 1)
 end
 if tag == 'song9' then
   songselect = songselect + 1
   runTimer('song', 0.5, 1)
 end
 if tag == 'song10' then
   songselect = songselect + 1
   runTimer('song', 0.5, 1)
 end
 if tag == 'song11' then
   songselect = songselect + 1
   runTimer('song', 0.5, 1)
 end 
 if tag == 'song666' then
   songselect = 1
   runTimer('song', 0.5, 1)
 end 
end

function onTweenCompleted(tag)
  if tag == 'jump' then
 	 doTweenY('down', 'cube', getProperty('cube.y')+ 125, 0.25, 'cubeIn') 
  end
  if tag == 'down' then
 	 cubeGround = true
  end  
end
-- made this Misha21220 [GD] (discord: artycity21#9929), please, delete psych from all my devices, i doing too much shit :)