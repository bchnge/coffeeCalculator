//
//  CoffeeListView.swift
//  coffeeCalculator
//
//  Created by Ben Cheng on 1/8/21.
//

import SwiftUI

struct CoffeeListView: View {
    var coffees: [Coffee]
    var body: some View {
        NavigationView{
            List{
                ForEach (coffees, id: \.self) { coffee in
                    NavigationLink(destination: CoffeeView(coffee:coffee)){
                        Text(coffee.name)
                    }
                }
            }
        }
    }
}
