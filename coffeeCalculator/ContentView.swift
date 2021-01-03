//
//  ContentView.swift
//  Food Tracker
//
//  Created by Ben Cheng on 12/30/20.
//

import SwiftUI
import SwiftUICharts

let coffeeRatio = 16

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

struct ContentView: View {
    @State var servingSize: Double = 400
    @State var acidity: Double = 0.5
    @State var pourOne: Double = 60
    
    var body: some View {
    VStack{
            Text("Serving Size:\(Int(servingSize))mL")
            Text("Recommended Coffee Dosage: \(Int(servingSize)/coffeeRatio)g")
            Slider(value: $servingSize, in: 100...800, step:25)
            Slider(value: $pourOne, in:10...500, step:20)
            Text("Adjust acidity")
            Slider(value: $acidity, in: 0.2...1.8, step:0.1)
            HStack{
                BarView(value: CGFloat(servingSize/5 * 0.25), maxHeight:500)
                BarView(value:CGFloat(servingSize/5 * 0.75), maxHeight:500)
                BarView(value:CGFloat(pourOne), maxHeight:500)
            }
//        BarChartView(data: ChartData(values: chartData), title: "Kasuya Water Distribution", legend: "mL") // legend is optional
            NavigationView{
                List(contacts, id: \.name) { contact in
                    NavigationLink(destination: ContactDetail(contact: contact)) {
                        ContactRow(contact: contact)
                    }
                }
                .navigationBarTitle(Text("Contacts!"))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
