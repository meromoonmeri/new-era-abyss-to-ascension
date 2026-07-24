require 'origin.common'
require 'halcyon.PartnerEssentials'
require 'halcyon.GeneralFunctions'
require 'halcyon.CharacterEssentials'

metano_rock_home_ch_3 = {}

function metano_rock_home_ch_3.SetupGround()
	if not SV.Chapter3.DefeatedBoss then
		local machamp  = 
			CharacterEssentials.MakeCharactersFromList({
				{'Machamp', 98, 128, Direction.Down}

			})
	end

	GAME:FadeIn(20)
end

function metano_rock_home_ch_3.Machamp_Action(chara, activator)
	GeneralFunctions.StartConversation(chara, "It's so great that wee " .. CharacterEssentials.GetCharacterName("Numel") .. " was found![pause=0] His mum mus' be so relieved.")
	UI:WaitShowDialogue(STRINGS:Format(STRINGS.MapStrings['MRH3_001']))
	GeneralFunctions.EndConversation(chara)
end 
