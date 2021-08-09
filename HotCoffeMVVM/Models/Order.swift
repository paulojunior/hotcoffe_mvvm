//
//  Order.swift
//  HotCoffeMVVM
//
//  Created by Junior Ferreira on 09/08/21.
//

import Foundation

enum CoffeType: String, Codable, CaseIterable {
    case cappuccino
    case latte
    case espressino
    case cortado
}

enum CoffeSize: String, Codable, CaseIterable {
    case small
    case medium
    case large
}

struct Order: Codable {
    let name: String
    let email: String
    let type: CoffeType
    let size: CoffeSize
}

extension Order {
    init?(_ vm: AddCoffeOrderViewModel) {
        
        guard let name = vm.name,
              let email = vm.email,
              let selectedType = CoffeType(rawValue: vm.selectedType!.lowercased()),
              let selectedSize = CoffeSize(rawValue: vm.selectedSize!.lowercased()) else {
            return nil
        }
        
        self.name = name
        self.email = email
        self.type = selectedType
        self.size = selectedSize
    }
}
