//
//  OrderListViewModel.swift
//  Coffee Ordering
//
//  Created by 김응철 on 2022/07/03.
//

import Foundation
import Combine

class OrderListViewModel: ObservableObject {
    @Published var orders = [OrderViewModel]()
    
    init() {
        fetchOrders()
    }
    
    func fetchOrders() {
        WebService().getAllOrders { orders in
            if let orders = orders {
                self.orders = orders.map {
                    return OrderViewModel(order: $0)
                }
            }
        }
    }
}

/// For One Cell
class OrderViewModel {
    let id = UUID()
    
    var order: Order
    
    init(order: Order) {
        self.order = order
    }
    
    var name: String {
        return order.name
    }
    
    var size: String {
        return order.size
    }
    
    var coffeeName: String {
        return order.coffeeName
    }
    
    var total: Double {
        return order.total
    }
}
