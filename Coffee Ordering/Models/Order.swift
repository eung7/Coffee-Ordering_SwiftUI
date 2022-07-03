//
//  Order.swift
//  Coffee Ordering
//
//  Created by 김응철 on 2022/07/03.
//

import Foundation

struct Order: Codable {
    let name: String
    let size: String
    let coffeeName: String
    let total: Double
}
