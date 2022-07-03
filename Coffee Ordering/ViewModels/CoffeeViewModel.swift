//
//  CoffeeViewModel.swift
//  Coffee Ordering
//
//  Created by 김응철 on 2022/07/03.
//

import Foundation

class CoffeeListViewModel {
    var coffeeList: [CoffeeViewModel] = [CoffeeViewModel]()
}

struct CoffeeViewModel {
    var coffee: Coffee
    
    init(coffee: Coffee) {
        self.coffee = coffee
    }
    
    var name: String {
        return coffee.name
    }
    
    var imageURL: String {
        return coffee.imageURL
    }
    
    var price: Double {
        return coffee.price
    }
}
