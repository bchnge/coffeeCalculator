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
    var cornerRadius: CGFloat = 1
    var label: String
    var scalar: CGFloat = 0.6
    var body: some View {
        VStack {
            ZStack (alignment: .bottom) {
                RoundedRectangle(cornerRadius: cornerRadius)
                   .frame(width: 30, height: maxHeight).foregroundColor(.black)
                VStack{
                    Text(((value * 10.0).rounded()/10.0).description)
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .frame(width: 45, height: value * scalar).foregroundColor(.blue)
                    Text(label)
                }
            }
        }
    }
}
