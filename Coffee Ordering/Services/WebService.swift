//
//  WebService.swift
//  Coffee Ordering
//
//  Created by 김응철 on 2022/07/03.
//

import Foundation

class WebService {
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

