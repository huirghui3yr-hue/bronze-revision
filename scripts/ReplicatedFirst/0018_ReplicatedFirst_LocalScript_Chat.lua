local Chat = game:GetService("Chat")

Chat:RegisterChatCallback(Enum.ChatCallbackType.OnCreatingChatWindow, function()
    return {
        ClassicChatEnabled = true,
        BubbleChatEnabled = true,
    }
end)