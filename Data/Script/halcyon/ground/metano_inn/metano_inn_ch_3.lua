require 'origin.common'
require 'halcyon.PartnerEssentials'
require 'halcyon.GeneralFunctions'
require 'halcyon.CharacterEssentials'

metano_inn_ch_3 = {}

function metano_inn_ch_3.SetupGround()
	if SV.Chapter3.DefeatedBoss then
		
		local nidorina, nidoking, nidoran_m = 
		CharacterEssentials.MakeCharactersFromList({
			{'Nidorina', 'Innkeeper_Right'},
			{'Nidoking', 'Innkeeper_Left'},
			{'Nidoran_M', 280, 184, Direction.Down}

		})
		
		AI:SetCharacterAI(nidoran_m, "halcyon.ai.ground_default", RogueElements.Loc(264, 168), RogueElements.Loc(32, 32), 1, 16, 64, 40, 180)

	else 
		GROUND:Hide('Innkeeper_Desk_Left')
		
		local nidoqueen, nidoran_m, seviper, zangoose = 
			CharacterEssentials.MakeCharactersFromList({
				{'Nidoqueen', 'Innkeeper_Right'},
				{'Nidoran_M', 168, 192, Direction.Down},
				{'Seviper', 317, 273, Direction.Up},
				{'Zangoose', 317, 210, Direction.Down}

			})
		
		AI:SetCharacterAI(nidoran_m, "halcyon.ai.ground_default", RogueElements.Loc(152, 176), RogueElements.Loc(32, 32), 1, 16, 64, 40, 180)
	end

	GAME:FadeIn(20)
end



function metano_inn_ch_3.Nidoran_M_Action(chara, activator)
	if not SV.Chapter3.DefeatedBoss then 
		GeneralFunctions.StartConversation(chara, "Googoogagee!")
	else
		GeneralFunctions.StartConversation(chara, ".........")
		GROUND:CharSetEmote(chara, "question", 1)
		SOUND:PlayBattleSE('EVT_Emote_Confused')
		UI:WaitShowDialogue(STRINGS:Format(STRINGS.MapStrings['MI3_001']))
	end
	GeneralFunctions.EndConversation(chara)
end


function metano_inn_ch_3.Innkeeper_Desk_Left_Action(chara, activator)
	local nidoking = CH('Nidoking')
	GeneralFunctions.StartConversation(nidoking, "My daughter here is helpin' me man the front desk today!")
	UI:WaitShowDialogue(STRINGS:Format(STRINGS.MapStrings['MI3_002']))
	GeneralFunctions.EndConversation(nidoking)
end

function metano_inn_ch_3.Innkeeper_Desk_Right_Action(chara, activator)
	if not SV.Chapter3.DefeatedBoss then 
		local nidoqueen = CH('Nidoqueen')
		GeneralFunctions.StartConversation(nidoqueen, "Seems like nothin' dangerous was afoot in town after all.[pause=0] That young'un had just wandered off was all!")
		UI:SetSpeakerEmotion("Happy")
		UI:WaitShowDialogue(STRINGS:Format(STRINGS.MapStrings['MI3_003']))
		GeneralFunctions.EndConversation(nidoqueen)
	else 
		local nidorina = CH('Nidorina')
		GeneralFunctions.StartConversation(nidorina, ".........")
		UI:WaitShowDialogue(STRINGS:Format(STRINGS.MapStrings['MI3_004']))
		GeneralFunctions.EndConversation(nidorina)
	end
end



function metano_inn_ch_3.Zangoose_Action(chara, activator)
	GeneralFunctions.StartConversation(chara, "This inn is one of the best places we've stayed at in our travels.[pause=0] Guess it's earned its reputation.")
	--too long with no nicknames
	UI:WaitShowDialogue(STRINGS:Format(STRINGS.MapStrings['MI3_005'], CharacterEssentials.GetCharacterName("Seviper")))
	UI:WaitShowDialogue(STRINGS:Format(STRINGS.MapStrings['MI3_006']))
	GeneralFunctions.EndConversation(chara)
end

function metano_inn_ch_3.Seviper_Action(chara, activator)
	GeneralFunctions.StartConversation(chara, "There'ssss been a lot of outlaw activity in this region lately.")
	UI:WaitShowDialogue(STRINGS:Format(STRINGS.MapStrings['MI3_007'], CharacterEssentials.GetCharacterName("Zangoose")))
	UI:WaitShowDialogue(STRINGS:Format(STRINGS.MapStrings['MI3_008']))
	UI:WaitShowDialogue(STRINGS:Format(STRINGS.MapStrings['MI3_009']))
	GeneralFunctions.EndConversation(chara)
end