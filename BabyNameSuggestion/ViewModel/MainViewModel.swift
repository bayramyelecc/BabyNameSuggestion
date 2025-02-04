//
//  MainViewModel.swift
//  BabyNameSuggestion
//
//  Created by Bayram Yeleç on 25.12.2024.
//

import Foundation

class MainViewModel {
    
    var names: [Name] = [] {
        didSet {
            reloadNames?()
        }
    }
    
    var meanings: [Name] = [] {
        didSet {
            reloadMeanings?()
        }
    }
    
    var reloadNames: (() -> Void)?
    
    var reloadMeanings: (() -> Void)?
    
    func fetchNames(gender: String, popularity: String, category: String, harmony: String) async {
        await GenerativeService.shared.generateName(gender: gender, popularity: popularity, category: category, harmony: harmony)
        reloadNames?()
    }
    
}
