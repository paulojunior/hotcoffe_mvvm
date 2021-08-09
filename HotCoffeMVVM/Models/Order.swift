//
//  Order.swift
//  HotCoffeMVVM
//
//  Created by Junior Ferreira on 09/08/21.
//

import Foundation

enum CoffeType: String, Codable {
    case cappuccino
    case latte
    case espressino
    case cortado
}

enum CoffeSize: String, Codable {
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
