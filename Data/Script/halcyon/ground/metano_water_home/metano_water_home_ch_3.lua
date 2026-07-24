require 'origin.common'
require 'halcyon.PartnerEssentials'
require 'halcyon.GeneralFunctions'
require 'halcyon.CharacterEssentials'

metano_water_home_ch_3 = {}

function metano_water_home_ch_3.SetupGround()
	
	if not SV.Chapter3.DefeatedBoss then
		local quagsire, floatzel  = 
			CharacterEssentials.MakeCharactersFromList({
				{'Quagsire', 232, 168, Direction.Up},
				{'Floatzel', 232, 120, Direction.Down}
			})
	end
		
	GAME:FadeIn(20)
end

function metano_water_home_ch_3.Quagsire_Action(chara, activator)
	GeneralFunctions.StartConversation(chara, "It's wonderful that " .. CharacterEssentials.GetCharacterName("Numel") .. " was rescued after wandering off,[pause=10] but...", "Worried")
	UI:WaitShowDialogue(STRINGS:Format(STRINGS.MapStrings['MWH3_001']))
	UI:WaitShowDialogue(STRINGS:Format(STRINGS.MapStrings['MWH3_002']))
	GeneralFunctions.EndConversation(chara)
end 

function metano_water_home_ch_3.Floatzel_Action(chara, activator)
	GeneralFunctions.StartConversation(chara, "I'm not too worried if " .. CharacterEssentials.GetCharacterName("Wooper_Girl") .. " or " .. CharacterEssentials.GetCharacterName("Wooper_Boy") .. " wander off.")
	UI:WaitShowDialogue(STRINGS:Format(STRINGS.MapStrings['MWH3_003']))
	UI:WaitShowDialogue(STRINGS:Format(STRINGS.MapStrings['MWH3_004'], CharacterEssentials.GetCharacterName("Numel")))
	GeneralFunctions.EndConversation(chara)
end 