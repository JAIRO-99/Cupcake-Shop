//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by New on 17/01/24.
//

import SwiftUI

struct AddressView: View {
    
   @Bindable var order: Order // @Bindable es el property rapper que crea enlaces direccionales en clases de vistas mas profundas
    
    var body: some View {
        Form{
            Section{
                TextField("Name", text: $order.name)
                TextField("Street Address", text: $order.streetAddress)
                TextField("City", text: $order.city)
                TextField("Zip", text: $order.zip)
            }
            Section{
                NavigationLink("Check Out"){
                    CheckoutView(order: order)
                }
            }
            .disabled(order.hasValidAddress == false)
        }
    }
}

#Preview {
    AddressView(order: Order())
}
