//
//  AddCoffeOrderViewModel.swift
//  HotCoffeMVVM
//
//  Created by Junior Ferreira on 09/08/21.
//

import Foundation

struct AddCoffeOrderViewModel {
    var name: String?
    var email: String?
    
    var selectedType: String?
    var selectedSize: String?
    
    var types: [String]? {
        return CoffeType.allCases.map { $0.rawValue.capitalized }
    }
    
    var sizes: [String]? {
        return CoffeSize.allCases.map { $0.rawValue.capitalized }
    }
}
