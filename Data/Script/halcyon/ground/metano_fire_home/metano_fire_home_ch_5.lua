require 'origin.common'
require 'halcyon.PartnerEssentials'
require 'halcyon.GeneralFunctions'
require 'halcyon.CharacterEssentials'

metano_fire_home_ch_5 = {}

function metano_fire_home_ch_5.SetupGround()

	local camerupt  = 
		CharacterEssentials.MakeCharactersFromList({
			{'Camerupt', 256, 136, Direction.Down}
		})

	
	GAME:FadeIn(20)
end

function metano_fire_home_ch_5.Camerupt_Action(chara, activator)
	GeneralFunctions.StartConversation(chara, "My baby boy's been working so hard lately,[pause=10] I'm so proud of him!", "Happy")
	UI:SetSpeakerEmotion("Normal")
	UI:WaitShowDialogue(STRINGS:Format(STRINGS.MapStrings['MFH5_001']))
	UI:WaitShowDialogue(STRINGS:Format(STRINGS.MapStrings['MFH5_002']))
	GeneralFunctions.EndConversation(chara)
end 
