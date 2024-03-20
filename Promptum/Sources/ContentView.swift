//
//  ContentView.swift
//  Promptum
//
//  Created by Виктор Иванов on 07.03.2024.
//
//


import OpenAISwift
import SwiftUI

struct ContentView: View {
    
    @State private var chatMessages: [ChatMessage] = ChatMessage.sampleMessages
    @State private var messageText: String = ""
    let openAIService = OpenAIService()
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack {
                    ForEach(chatMessages, id: \.id) { message in
                        messageView(message: message)
                    }
                }
            }
            HStack {
                TextField("Enter a message...", text: $messageText) {
                    
                }
                    .padding()
                    .background(.gray.opacity(0.1))
                    .cornerRadius(12)
                Button {
                    sendMessage()
                } label: {
                    Text("Send")
                        .foregroundStyle(.white)
                        .padding()
                        .background(.black)
                        .cornerRadius(12)
                }
                
            }
            
        }
        .padding()
        .onAppear {
            openAIService.sendMessage(message: "2 + 2 = ?")
        }
    }
    
    private func messageView(message: ChatMessage) -> some View {
        HStack {
            if message.sender == .me { Spacer() }
            Text(message.content)
                .foregroundStyle(message.sender == .me ? Color.white : Color.black)
                .padding()
                .background(message.sender == .me ? .blue : .gray.opacity(0.1))
                .cornerRadius(16)
            if message.sender == .gpt { Spacer() }
        }
    }
    
    private func sendMessage() {
        messageText = ""
        print(messageText)
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ChatMessage {
    let id: String
    let content: String
    let dateCreated: Date
    let sender: MessageSender
}

enum MessageSender {
    case me
    case gpt
}

extension ChatMessage {
    static let sampleMessages = [
        ChatMessage(id: UUID().uuidString, content: "Hello", dateCreated: Date(), sender: .me),
        ChatMessage(id: UUID().uuidString, content: "Hello", dateCreated: Date(), sender: .gpt),
        ChatMessage(id: UUID().uuidString, content: "Hello", dateCreated: Date(), sender: .me),
        ChatMessage(id: UUID().uuidString, content: "Hello", dateCreated: Date(), sender: .gpt)
    ]
}
