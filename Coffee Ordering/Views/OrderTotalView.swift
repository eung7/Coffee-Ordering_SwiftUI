//
//  OrderTotalView.swift
//  Coffee Ordering
//
//  Created by 김응철 on 2022/07/04.
//

import SwiftUI

struct OrderTotalView: View {
    let total: Double
    
    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            Text(String(format: "$%.2f", total))
                .font(.title)
                .foregroundColor(Color.green)
            Spacer()
            
        }.padding(10)
    }
}

struct OrderTotalView_Previews: PreviewProvider {
    static var previews: some View {
        OrderTotalView(total: 45.67)
    }
}
