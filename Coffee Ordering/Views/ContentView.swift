//
//  ContentView.swift
//  Coffee Ordering
//
//  Created by 김응철 on 2022/07/03.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var orderListVM = OrderListViewModel()
    
    var body: some View {
        NavigationView {
            OrderListView(orders: orderListVM.orders)
                .navigationTitle("Coffee Orders")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
