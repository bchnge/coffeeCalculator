//
//  BarView.swift
//  Food Tracker
//
//  Created by Ben Cheng on 1/2/21.
//

import SwiftUI

struct BarView: View{

    var value: CGFloat
    var maxHeight: CGFloat
    var cornerRadius: CGFloat = 1
    
    var body: some View {
        VStack {
            ZStack (alignment: .bottom) {
                RoundedRectangle(cornerRadius: cornerRadius)
                   .frame(width: 30, height: maxHeight).foregroundColor(.black)
                VStack{
                    Text(value.description)
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .frame(width: 45, height: value).foregroundColor(.green)
                }
            }
        }
    }
}
