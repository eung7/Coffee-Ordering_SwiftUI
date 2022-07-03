//
//  WebService.swift
//  Coffee Ordering
//
//  Created by 김응철 on 2022/07/03.
//

import Foundation

class WebService {
    func createCoffeeOrder(order: Order, completion: @escaping (CreateOrderResponse?) -> Void) {
        guard let url = URL(string: "https://island-bramble.glitch.me/orders") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(order)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else { return }
            let createOrderResponse = try? JSONDecoder().decode(CreateOrderResponse.self, from: data)
            DispatchQueue.main.async {
                completion(createOrderResponse)
            }
        }.resume()
    }
    
    func getAllOrders(completion: @escaping ([Order]?) -> Void) {
        guard let url = URL(string: "https://island-bramble.glitch.me/orders") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            let orders = try? JSONDecoder().decode([Order].self, from: data)
            DispatchQueue.main.async {
                completion(orders)
            }
        }.resume()
    }
}
