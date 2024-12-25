//
//  GenerativeService.swift
//  BabyNameSuggestion
//
//  Created by Bayram Yeleç on 25.12.2024.
//

import Foundation
import GoogleGenerativeAI


class GenerativeService {
    
    static let shared = GenerativeService()
    
    var viewModel = MainViewModel()
    
    func generateName(gender: String, popularity: String, category: String, harmony: String) async {
        
        let genModel = GenerativeModel(name: "gemini-1.5-flash", apiKey: "AIzaSyA2OBvTrHZUQFzofARH4ph29jCOU-7tQkI")
        
        let prompt = "Bebek için \(gender) cinsiyetinde, popülerliği \(popularity) olan, \(category) kategorisinde ve soyadı \(harmony) ile uyumlu 10 adet türkçe isim önerisi."
        
        do {
            let response = try await genModel.generateContent(prompt)
            print("API Yanıtı: \(response)")
            
            let namesAndMeanings = response.text?.components(separatedBy: "\n")
            
            var names: [String] = []
            var meanings: [String] = []
            
            namesAndMeanings?.forEach { line in
                let parts = line.split(separator: ":")
                if parts.count == 2 {
                    let name = String(parts[0]).replacingOccurrences(of: "*", with: "").trimmingCharacters(in: .whitespaces)
                    let meaning = String(parts[1]).replacingOccurrences(of: "*", with: "").trimmingCharacters(in: .whitespaces)
                    names.append(name)
                    meanings.append(meaning)
                }
            }
            
            self.viewModel.names = names
            self.viewModel.meanings = meanings
            
        } catch {
            print("\(error.localizedDescription as Any)")
        }
    }
    
    
}
