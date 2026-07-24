require 'origin.common'
require 'halcyon.PartnerEssentials'
require 'halcyon.GeneralFunctions'
require 'halcyon.CharacterEssentials'

metano_cafe_ch_4 = {}

function metano_cafe_ch_4.SetupGround()
	if not SV.Chapter4.FinishedGrove then
		local gulpin, lickitung, linoone = 
			CharacterEssentials.MakeCharactersFromList({
				{'Gulpin', 'Cafe_Table_2'},
				{'Lickitung', 'Cafe_Table_1'},
				{'Linoone', 'Cafe_Table_14'}
			})
	else
		local gulpin, lickitung, mareep, cranidos = 
			CharacterEssentials.MakeCharactersFromList({
				{'Gulpin', 'Cafe_Table_2'},
				{'Lickitung', 'Cafe_Table_1'},
				{'Mareep', 'Cafe_Table_9'},
				{'Cranidos', 'Cafe_Table_10'}
			})
	end
		
	GAME:FadeIn(20)
end



function metano_cafe_ch_4.Lickitung_Action(chara, activator)
	if not SV.Chapter4.FinishedGrove then
		local item = RogueEssence.Dungeon.InvItem('cafe_endurance_tonic')
		GeneralFunctions.StartConversation(chara, "You hear the news?[pause=0] " .. CharacterEssentials.GetCharacterName("Shuckle") .. " just added a new drink to the menu.")
		UI:WaitShowDialogue(STRINGS:Format(STRINGS.MapStrings['MCF4_001'], item:GetDisplayName()))
	else
		GeneralFunctions.StartConversation(chara, "Besides his drinks,[pause=10] " .. CharacterEssentials.GetCharacterName("Shuckle") .. " also has a daily special he sells on the side.")
		UI:WaitShowDialogue(STRINGS:Format(STRINGS.MapStrings['MCF4_002']))
	end
	GeneralFunctions.EndConversation(chara)
end 

function metano_cafe_ch_4.Gulpin_Action(chara, activator)
	if not SV.Chapter4.FinishedGrove then
		local item = RogueEssence.Dungeon.InvItem('cafe_endurance_tonic')
		GeneralFunctions.StartConversation(chara, "So tasty...[pause=0] When I drink " .. item:GetDisplayName() .. ",[pause=10] I feel like nothing can stop me...", "Inspired")
	else
		local item = RogueEssence.Dungeon.InvItem('food_apple_perfect')
		GeneralFunctions.StartConversation(chara, "One time,[pause=10] " .. CharacterEssentials.GetCharacterName("Shuckle") .. " had a " .. item:GetDisplayName() .. " as the side special for the day!", "Normal")
		UI:SetSpeakerEmotion("Inspired")
		UI:WaitShowDialogue(STRINGS:Format(STRINGS.MapStrings['MCF4_003']))
		UI:SetSpeakerEmotion("Sad")
		UI:WaitShowDialogue(STRINGS:Format(STRINGS.MapStrings['MCF4_004']))
	end
	GeneralFunctions.EndConversation(chara)
end 

function metano_cafe_ch_4.Linoone_Action(chara, activator)
	if not SV.Chapter4.FinishedGrove then
		GeneralFunctions.StartConversation(chara, "I'm still reading this book on mystery dungeons.[pause=0] This chapter talks about the stairs within dungeons.")
		UI:WaitShowDialogue(STRINGS:Format(STRINGS.MapStrings['MCF4_005']))
		UI:WaitShowDialogue(STRINGS:Format(STRINGS.MapStrings['MCF4_006']))
		UI:WaitShowDialogue(STRINGS:Format(STRINGS.MapStrings['MCF4_007']))
		UI:WaitShowDialogue(STRINGS:Format(STRINGS.MapStrings['MCF4_008']))
		UI:WaitShowDialogue(STRINGS:Format(STRINGS.MapStrings['MCF4_009']))
	else
		--N/A
	end
	GeneralFunctions.EndConversation(chara)
		
end


function metano_cafe_ch_4.Cranidos_Action(chara, activator)
	if not SV.Chapter4.FinishedGrove then
		--N/A
	else
		if not SV.Chapter4.CranidosBlush then
			GeneralFunctions.StartConversation(chara, "Even with the expedition approaching,[pause=10] I'd rather continue nabbing outlaws than rest here.")
			UI:WaitShowDialogue(STRINGS:Format(STRINGS.MapStrings['MCF4_010'], CharacterEssentials.GetCharacterName("Mareep")))
			GAME:WaitFrames(40)
			GeneralFunctions.EmoteAndPause(chara, "Exclaim", true)
			--GROUND:CharSetEmote(chara, "sweating", 1)
			UI:SetSpeakerEmotion("Surprised")
			UI:WaitShowDialogue(STRINGS:Format(STRINGS.MapStrings['MCF4_011']))
			GeneralFunctions.EmoteAndPause(chara, "Sweating", true)
			UI:SetSpeakerEmotion("Special0")
			UI:WaitShowDialogue(STRINGS:Format(STRINGS.MapStrings['MCF4_012']))
			SV.Chapter4.CranidosBlush = true
		else 
			GeneralFunctions.StartConversation(chara, "H-hey...[pause=0] Please don't tell her what I said earlier...", "Special0")
		end
	end
	GeneralFunctions.EndConversation(chara)
		
end

function metano_cafe_ch_4.Mareep_Action(chara, activator)
	if not SV.Chapter4.FinishedGrove then
		--N/A
	else
		GeneralFunctions.StartConversation(chara, "Hi you two![pause=0] Me and " .. CharacterEssentials.GetCharacterName("Cranidos") .. " are relaxing here until the expedition sta-a-a-arts!", "Happy")
		UI:SetSpeakerEmotion("Normal")
		UI:WaitShowDialogue(STRINGS:Format(STRINGS.MapStrings['MCF4_013']))
	end
	GeneralFunctions.EndConversation(chara)
		
end
