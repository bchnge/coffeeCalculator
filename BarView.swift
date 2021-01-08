//
//  BarView.swift
//  Food Tracker
//
//  Created by Ben Cheng on 1/2/21.
//

import SwiftUI

struct BarView: View{

    var value: CGFloat
    var maxHeight: CGFloat = 250
    var cornerRadius: CGFloat = 20
    var label: String
    var scalar: CGFloat = 0.3
    var barFill: Color = .blue;
    var body: some View {
        HStack {
            Text(label)
            ZStack (alignment: .leading) {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .frame(width: maxHeight * scalar, height: 20)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .frame(width: value * scalar, height: 20)
                    .foregroundColor(barFill)
        }
            Text("+" + roundIt(x: Double(value)).description + "mL").foregroundColor(.blue)
            Spacer()
    }
}
}
