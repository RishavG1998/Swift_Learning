//
//  ContentView.swift
//  Gemini Chat Bot
//
//  Created by Rishav Gupta on 08/09/24.
//

import SwiftUI

struct ContentView: View {
    private let viewModel = ChatBotViewModel()
    @State private var textField = ""
    @State private var showLoader = false
    var body: some View {
        VStack {
            ScrollView {
                ZStack {
                    
                }
                VStack {
                    if let response = viewModel.response {
                        Text(response)
                    }
                }
            }
            Spacer()
            HStack {
                TextField(text: $textField) {
                    Text("Ask me anything...")
                }.onSubmit {
                    sendQuestion(textField)
                }
                
                Button {
                    sendQuestion(textField)
                } label: {
                    Image(systemName: "arrow.up.circle")
                        .foregroundColor(.blue)
                }
            }
        }
        .padding()
        .showLoader(showLoader: showLoader)
    }
    
    func sendQuestion(_ question: String) {
        showLoader = true
        textField = ""
        if !question.isEmpty {
            Task {
                try await viewModel.generateAnswer(question: question)
                showLoader = false
            }
        }
    }
}

#Preview {
    ContentView()
}
