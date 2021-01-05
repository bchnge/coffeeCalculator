//
//  ContentView.swift
//  Food Tracker
//
//  Created by Ben Cheng on 12/30/20.
//

import SwiftUI
import SwiftUICharts

let contacts = [
    Contact(name: "Marvin", jobTitle: "Paranoid Android", phone: "+1-200-8261-0817"),
    Contact(name: "Arthur Dent", jobTitle: "BBC Radio employee", phone: "+1-200-1234-5678"),
    Contact(name: "Zaphod Beeblebrox", jobTitle: "President of Universe", phone: "+1-200-7162-2715"),
    Contact(name: "Ford Prefect", jobTitle: "Alien journalist", phone: "+1-200-8162-7651"),
    Contact(name: "Trillian Astra", jobTitle: "Mathematician", phone: "+1-200-9876-5432"),
]
struct Contact {
    var name:String
    var jobTitle:String
    var phone:String
}

func roundIt(x: Double) -> Double {
    return Double((x*10.0).rounded()/(10.0))
}

struct ContentView: View {
    @State var servingSize: Double = 400
    @State var acidity: Double = 0.5
    @State var coffeeRatio: Double = 16.0
    var body: some View {
        VStack {
            //Text("Tetsu Kasuya 4:6")
             //   .font(.largeTitle)
              //  .padding(5)
            VStack{
                Text("\(roundIt(x: servingSize/coffeeRatio).description)g")
                    .font(.largeTitle)
                    .foregroundColor(.blue)
                Text("Recommended coffe e dosage")
            }.padding(10)
            Button(action: {
                // Prepare URL
                let url = URL(string: "http://192.168.50.81:5000/query?coffee=900&water=9999")
                guard let requestUrl = url else { fatalError() }

                // Prepare URL Request Object
                var request = URLRequest(url: requestUrl)
                request.httpMethod = "POST"
                 
                // HTTP Request Parameters which will be sent in HTTP Request Body
                let postString = "coffee=900&water=9999";

                // Set HTTP Request Body
                request.httpBody = postString.data(using: String.Encoding.utf8);

                // Perform HTTP Request
                let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                        
                        // Check for Error
                        if let error = error {
                            print("Error took place \(error)")
                            return
                        }
                 
                        // Convert HTTP Response Data to a String
                        if let data = data, let dataString = String(data: data, encoding: .utf8) {
                            print("Response data string:\n \(dataString)")
                        }
                }
                task.resume()
                // What to perform
            }) {
                Text("Send!")
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .font(.title)
                // How the button looks like
            }
            VStack{
                HStack {
                    BarView(value: CGFloat(servingSize/5 * acidity), label:"1")
                    BarView(value: CGFloat(servingSize/5 * (2-acidity)), label:"2")
                    BarView(value: CGFloat(servingSize/5), label:"3")
                    BarView(value: CGFloat(servingSize/5), label:"4")
                    BarView(value: CGFloat(servingSize/5), label:"5")
                    }
                Text("mL per pour")
            }
            VStack{
                HStack {
                    BarView(value: CGFloat(servingSize/5 * acidity), maxHeight:200, label:"1", scalar:0.1)
                    BarView(value: CGFloat(servingSize/5 * 2), maxHeight:200, label:"2", scalar:0.1)
                    BarView(value: CGFloat(servingSize/5 * 3), maxHeight:200, label:"3", scalar:0.1)
                    BarView(value: CGFloat(servingSize/5 * 4), maxHeight:200, label:"4", scalar: 0.1)
                    BarView(value: CGFloat(servingSize/5 * 5), maxHeight:200, label:"5", scalar: 0.1)
                }
                Text("Total mL")
            }
            // USER INPUT
            VStack{
                Text("Serving Size")
                HStack {
                    Slider(value: $servingSize, in: 100...800, step:25)
                    Text("\(Int(servingSize))mL")
                    }
                //Spacer().frame(height:10)
                Text("Water-coffee ratio")
                HStack {
                    Slider(value: $coffeeRatio, in: 14...20, step:0.5)
                    Text("\(roundIt(x: coffeeRatio).description):1")
                }
                //Spacer().frame(height:10)
                //Spacer().frame(height:10)
                VStack{
                    Text("Acidity")
                    HStack {
                        Slider(value: $acidity, in: 0.2...1.8, step:0.1)
                        Text("\(roundIt(x: acidity).description):1")
                    }
                }

            }
            Spacer().frame(height:40)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
