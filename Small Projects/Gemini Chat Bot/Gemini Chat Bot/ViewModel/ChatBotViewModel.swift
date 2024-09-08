//
//  ChatBotViewModel.swift
//  Gemini Chat Bot
//
//  Created by Rishav Gupta on 08/09/24.
//

import Foundation
import GoogleGenerativeAI

@Observable
class ChatBotViewModel {
//    api key = AIzaSyBFmZJyrZP3bWWtF2M4gb2bNkfp9Dtvvrg
    let model: GenerativeModel
    var response: String?
    
    init() {
        guard let key = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String else {
            fatalError("fatal error: no such ket found")
        }
        model = GenerativeModel(name: "gemini-1.5-flash-latest", apiKey: key)
        response = nil
    }
    
    func generateAnswer(question: String) async throws {
        self.response = nil
        do {
            let response = try await model.generateContent(question)
            self.response = response.text ?? "Bad Request, Try Again!"
        } catch {
            throw error
        }
    }
}
