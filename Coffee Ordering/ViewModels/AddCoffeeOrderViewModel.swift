//
//  AddCoffeeViewModel.swift
//  Coffee Ordering
//
//  Created by 김응철 on 2022/07/03.
//

import Foundation
import Combine

class AddCoffeeOrderViewModel: ObservableObject {
    var name: String = ""
    @Published var size: String = "Medium"
    @Published var coffeeName: String = ""
    
    private var webService: WebService
    
    var coffeeList: [CoffeeViewModel] {
        return Coffee.all().map {
            return CoffeeViewModel(coffee: $0)
        }
    }
    
    init() {
        self.webService = WebService()
    }
    
    var total: Double {
        return calculateTotalPrice()
    }
    
    func placeOrder() {
        let order = Order(name: name, size: size, coffeeName: coffeeName, total: total)
        webService.createCoffeeOrder(order: order) { _ in
            
        }
    }
    
    private func priceForSize() -> Double {
        let prices = ["Small": 2.0, "Medium": 3.0, "Large": 4.0]
        return prices[size]!
    }
    
    private func calculateTotalPrice() -> Double {
        let coffeeVM = coffeeList.first { $0.name == coffeeName }
        if let coffeeVM = coffeeVM {
            return coffeeVM.price * priceForSize()
        } else {
            return 0.0
        }
    }
}
