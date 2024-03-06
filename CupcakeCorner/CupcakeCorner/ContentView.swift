//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by New on 12/01/24.
//
import SwiftUI


@Observable
class User: Codable{
    enum CodingKeys: String, CodingKey{
        case _name = "name"
    }
    var name = "Taylor"
}



struct ContentView: View {
    
    @State private var order = Order()
    
    var body: some View {

        NavigationStack{
            Form{
                Section{
                    Picker("Select your cake type", selection: $order.type){
                        ForEach(Order.types.indices, id: \.self){
                            Text(Order.types[$0])
                        }
                    }
                    Stepper("Number of cakes: \(order.quantity)", value: $order.quantity, in: 3...10)
                }
                Section{
                    Toggle("Any special request?", isOn: $order.specialRequestEnabled.animation())
                    
                    if order.specialRequestEnabled{
                        Toggle("Add extra frosting", isOn: $order.extraFrosting)
                        
                        Toggle("Add extra sprinkles", isOn: $order.addSprinkles)
                    }
                }
                Section{
                    NavigationLink("Delivery Details"){
                        AddressView(order: order)
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
        
        
    }
}

#Preview {
    ContentView()
}
