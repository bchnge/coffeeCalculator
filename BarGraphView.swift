//
//  BarGraphView.swift
//  Food Tracker
//
//  Created by Ben Cheng on 1/2/21.
//

import SwiftUI

struct BarGraphView: View {
    var data: List
    var body: some View {
        List(contacts, id: \.name) { contact in
            NavigationLink(destination: ContactDetail(contact: contact)) {
                ContactRow(contact: contact)
            }
        }
    }
}

struct BarGraphView_Previews: PreviewProvider {
    static var previews: some View {
        BarGraphView()
    }
}
