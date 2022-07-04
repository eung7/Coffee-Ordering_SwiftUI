//
//  ContentView.swift
//  Coffee Ordering
//
//  Created by 김응철 on 2022/07/03.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var orderListVM = OrderListViewModel()
    @State private var showModal: Bool = false
    
    var body: some View {
        NavigationView {
            OrderListView(orders: orderListVM.orders)
                .navigationTitle("Coffee Orders")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            reloadOrders()
                        } label: {
                            Image(systemName: "arrow.clockwise")
                                .foregroundColor(Color.black)
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            showAddCoffeeOrderView()
                        } label: {
                            Image(systemName: "plus")
                                .foregroundColor(Color.black)
                        }

                    }
                }
                .sheet(isPresented: $showModal) {
                    AddCoffeeOrderView(isPresented: $showModal)
                }
        }
        
    }
    
    private func reloadOrders() {
        orderListVM.fetchOrders()
    }
    
    private func showAddCoffeeOrderView() {
        showModal = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
