//
//  ContactRow.swift
//  Food Tracker
//
//  Created by Ben Cheng on 12/31/20.
//

import SwiftUI

struct ContactRow: View {
    var contact: Contact
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(contact.name).font(.title)
            HStack{
                Text(contact.jobTitle).font(.subheadline)
                Spacer()
                Text(contact.phone).font(.subheadline)
            }
        }
    }
}
