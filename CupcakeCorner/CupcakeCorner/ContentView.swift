//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by New on 12/01/24.
//
import SwiftUI

/*
struct Response: Codable{
    var results: [Result]
}
struct Result: Codable{
    var trackId: Int
    var trackName: String
    var collectionName: String
}
*/
/*
@Observable
class User: Codable{
    enum CodingKeys: String, CodingKey{
        case _name = "name"
    }
    var name = "Taylor"
}
*/


struct ContentView: View {
/*
@State private var results = [Result]()

//FORM
@State private var username = ""
@State private var email = ""
var disableForm: Bool{
    username.count < 5 || email.count < 5
}
@State private var counter = 0
@State private var engine: CHHapticEngine?

func prepareHaptics(){
    guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else {return}
    
    do {
        engine = try CHHapticEngine()
        try engine?.start()
    }catch{
        print("There was an error creating the engine: \(error.localizedDescription)")
    }
}
func complexSuccess(){
    guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else {return}
    
    var events = [CHHapticEvent]()
    
    let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1)
    let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 1)
    let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity,sharpness], relativeTime: 0)
    events.append(event)
    
    do{
        let pattern = try CHHapticPattern(events: events, parameters: [])
        let player = try engine?.makePlayer(with: pattern)
        try player?.start(atTime: 0)
    }catch{
        print("Failed to play pattern: \(error.localizedDescription)")
    }
}


func loadData() async {
    guard let url = URL(string: "https://itunes.apple.com/search?term=imagine+dragons&entity=song") else{
        print("Invalid URL")
        return
    }
    do {
        let (data, _) = try await URLSession.shared.data(from: url)
        
        if let decodedResponse = try? JSONDecoder().decode(Response.self,from: data){
            results = decodedResponse.results
        }
    } catch{
        print("Invalid data")
    }
}
*/
/*
func encodeTaylor(){
    let data = try! JSONEncoder().encode(User())
    let str = String(decoding: data, as: UTF8.self)
    print(str)
}
*/
    
    @State private var order = Order()
    
    var body: some View {
/*
        VStack {
            AsyncImage(url: URL(string: "https:/hws.dev/img/logo.png")){ phase in
                if let image = phase.image{
                    image
                        .resizable()
                        .scaledToFit()
                }else if phase.error != nil{
                    Text("There was an error loading the image")
                }else{
                    ProgressView()
                }
            }
            .frame(width: 200, height: 200)
            
            Form{
                Section{
                    TextField("Username", text: $username)
                    TextField("Email", text: $email)
                }
                Section{
                    Button("Create account"){
                        print("Creating account...")
                    }
                }
                .disabled(disableForm)
            }
            
            Button("Tap Count: \(counter)"){
                counter += 1
            }
            
            
            List(results, id: \.trackId){ item in
                VStack(alignment: .leading) {
                    Text(item.trackName)
                        .font(.headline)
                    
                    Text(item.collectionName)
                }
            }
            .task {
                await loadData()
        }
        }
        */
/*
Button("Encode Taylor", action: encodeTaylor)
*/
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
