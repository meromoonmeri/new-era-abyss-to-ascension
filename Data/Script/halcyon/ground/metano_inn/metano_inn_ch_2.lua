require 'origin.common'
require 'halcyon.PartnerEssentials'
require 'halcyon.GeneralFunctions'
require 'halcyon.CharacterEssentials'

metano_inn_ch_2 = {}

function metano_inn_ch_2.SetupGround()

	if not SV.Chapter2.FinishedFirstDay then 
		GROUND:Hide('Innkeeper_Desk_Right')
		
		local nidoking, nidoqueen, nidoran_m, makuhita = 
			CharacterEssentials.MakeCharactersFromList({
				{'Nidoking', 'Innkeeper_Left'},
				{'Nidoqueen', 168, 144, Direction.Right},
				{'Nidoran_M', 264, 152, Direction.UpLeft},
				{'Makuhita', 128, 248, Direction.DownRight}
			})
		
		AI:SetCharacterAI(nidoqueen, "halcyon.ai.ground_default", RogueElements.Loc(152, 128), RogueElements.Loc(32, 32), 1, 16, 64, 40, 180)
		AI:SetCharacterAI(nidoran_m, "halcyon.ai.ground_default", RogueElements.Loc(248, 136), RogueElements.Loc(32, 32), 1, 16, 64, 40, 180)
		AI:SetCharacterAI(makuhita, "halcyon.ai.ground_default", RogueElements.Loc(112, 232), RogueElements.Loc(32, 32), 1, 16, 64, 40, 180)
		

	else
		local nidoking, nidoqueen, nidoran_m, nidorina, makuhita = 
		CharacterEssentials.MakeCharactersFromList({
			{'Nidoking', 'Innkeeper_Left'},
			{'Nidoqueen', 'Innkeeper_Right'},
			{'Nidoran_M', 316, 164, Direction.Left},
			{'Nidorina', 264, 152, Direction.Down},
			{'Makuhita', 293, 273, Direction.Up}
		})
		
		AI:SetCharacterAI(nidorina, "halcyon.ai.ground_default", RogueElements.Loc(248, 136), RogueElements.Loc(32, 32), 1, 16, 64, 40, 180)
		GROUND:CharSetAnim(nidoran_m, "Sleep", true)
	end
	
	GAME:FadeIn(20)
end


function metano_inn_ch_2.Innkeeper_Desk_Left_Action(chara, activator)
	local nidoking = CH('Nidoking')
	if not SV.Chapter2.FinishedFirstDay then
		GeneralFunctions.StartConversation(nidoking, "Howdy y'all![pause=0] Welcome to the Metano Inn![pause=0] Can I get y'all a couple of beds for the evenin'?")
		UI:WaitShowDialogue(STRINGS:Format(STRINGS.MapStrings['MI2_001']))
		UI:SetSpeakerEmotion("Happy")
		UI:WaitShowDialogue(STRINGS:Format(STRINGS.MapStrings['MI2_002']))
	else 
		GeneralFunctions.StartConversation(nidoking, "Poor " .. CharacterEssentials.GetCharacterName('Camerupt') .. "'s young'un has gone missin'.")
		UI:SetSpeakerEmotion("Worried")
		UI:WaitShowDialogue(STRINGS:Format(STRINGS.MapStrings['MI2_003']))
		UI:SetSpeakerEmotion("Normal")
		UI:WaitShowDialogue(STRINGS:Format(STRINGS.MapStrings['MI2_004']))
	end
	GeneralFunctions.EndConversation(nidoking)
end

function metano_inn_ch_2.Nidoran_M_Action(chara, activator)
	if not SV.Chapter2.FinishedFirstDay then 
		GeneralFunctions.StartConversation(chara, "Goo...[pause=20] gaa!")
		GeneralFunctions.EndConversation(chara)
	else 
		UI:SetSpeaker(chara:GetDisplayName(),true, "", -1, "", RogueEssence.Data.Gender.Unknown)
		GeneralFunctions.StartConversation(chara, "ZZZzzz...", "Normal", false, false, false)
		GeneralFunctions.EndConversation(chara, false)
	end
end


--she isn't behind the desk on day 1
function metano_inn_ch_2.Nidoqueen_Action(chara, activator)
	GeneralFunctions.StartConversation(chara, "That's my hubby mannin' the front desk over yonder.")
	GROUND:CharSetEmote(chara, "happy", 0)
	UI:SetSpeakerEmotion("Special0")
	UI:WaitShowDialogue(STRINGS:Format(STRINGS.MapStrings['MI2_005']))
	GROUND:CharSetEmote(chara, "", 0)
	GeneralFunctions.EndConversation(chara)
end

--only active on day 2 
function metano_inn_ch_2.Innkeeper_Desk_Right_Action(chara, activator)
	local nidoqueen = CH('Nidoqueen')
	GeneralFunctions.StartConversation(nidoqueen, "We heard that one of the youngsters in town went missin' and now not a soul knows where he is.", "Worried")
	UI:WaitShowDialogue(STRINGS:Format(STRINGS.MapStrings['MI2_006']))
	GeneralFunctions.EndConversation(nidoqueen)
end

function metano_inn_ch_2.Nidorina_Action(chara, activator)
	GeneralFunctions.StartConversation(chara, "Can't believe I'm not allowed out until that stupid kid is found.", "Determined")
	UI:WaitShowDialogue(STRINGS:Format(STRINGS.MapStrings['MI2_007']))
	UI:SetSpeakerEmotion("Angry")
	UI:WaitShowDialogue(STRINGS:Format(STRINGS.MapStrings['MI2_008']))
	GeneralFunctions.EndConversation(chara)
end


function metano_inn_ch_2.Passerby_1_Action(chara, activator)
	if not SV.Chapter2.FinishedFirstDay then 
		GeneralFunctions.StartConversation(chara, "I'm passing through this area and decided to rest for a while at the inn here.")
		UI:WaitShowDialogue(STRINGS:Format(STRINGS.MapStrings['MI2_009']))
	else 
		GeneralFunctions.StartConversation(chara, "Last night's sleep was some of the best I've ever had.[pause=0] This really is a great inn!")
		UI:WaitShowDialogue(STRINGS:Format(STRINGS.MapStrings['MI2_010']))
	end
	GeneralFunctions.EndConversation(chara)
end