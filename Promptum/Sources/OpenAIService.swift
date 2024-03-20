//
//  OpenAIService.swift
//  Promptum
//
//  Created by Виктор Иванов on 18.03.2024.
//

import Foundation
import Alamofire

class OpenAIService {
    let baseUrl = "https://api.openai.com/v1/completions"
    
    func sendMessage(message: String) {
        let body = OpenAICompletionBody(model: "gpt-3.5-turbo", prompt: message, temperature: 0.7)
        
        let headers: HTTPHeaders = [
            "Authorization" : "Bearer \(Constants.openAIAPIKey)"
        ]
        
        AF.request(baseUrl + "completions", method: .post, parameters: body, encoder: .json, headers: headers).response { data in
            print(data)
        }
    }
}

struct OpenAICompletionBody: Encodable {
    let model: String
    let prompt: String
    let temperature: Float?
}
