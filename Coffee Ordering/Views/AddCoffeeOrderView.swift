//
//  AddCoffeeOrderView.swift
//  Coffee Ordering
//
//  Created by 김응철 on 2022/07/04.
//

import SwiftUI

struct AddCoffeeOrderView: View {
    @Binding var isPresented: Bool
    @ObservedObject private var addCoffeeOrderViewModel = AddCoffeeOrderViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section("INFORMATION") {
                        TextField("Enter name", text: $addCoffeeOrderViewModel.name)
                    }
                    Section("SELECT COFFEE") {
                        ForEach(addCoffeeOrderViewModel.coffeeList, id: \.name) { coffee in
                            CoffeeCellView(coffee: coffee, selection: $addCoffeeOrderViewModel.coffeeName)
                        }
                    }
                    Section {
                        Picker("", selection: $addCoffeeOrderViewModel.size) {
                            Text("Small")
                                .tag("Small")
                            Text("Medium")
                                .tag("Medium")
                            Text("Large")
                                .tag("Large")
                        }.pickerStyle(.segmented)
                    } header: {
                        Text("SELECT COFFEE")
                            .font(.body)
                    } footer: {
                        OrderTotalView(total: addCoffeeOrderViewModel.total)
                    }
                    Section {
                        HStack(alignment: .center) {
                            Spacer()
                            Button("Place Order") {
                                addCoffeeOrderViewModel.placeOrder()
                                isPresented = false
                            }.frame(width: 200, height: 50, alignment: .center)
                                .foregroundColor(Color.white)
                                .background(Color.blue)
                                .cornerRadius(10)
                            Spacer()
                        }
                    }
                }
                .navigationTitle("Add Order")
            }
        }
    }
}

struct AddCoffeeOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AddCoffeeOrderView(isPresented: .constant(false))
    }
}

struct CoffeeCellView: View {
    let coffee: CoffeeViewModel
    @Binding var selection: String
    
    var body: some View {
        HStack {
            Image(coffee.imageURL)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(16)
            Text(coffee.name)
                .font(.body)
                .padding([.leading], 20)
            Spacer()
            Image(systemName: selection == coffee.name ? "checkmark" : "")
                .padding()
        }.onTapGesture {
            selection = coffee.name
        }
    }
}
