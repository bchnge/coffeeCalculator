//
//  ContactDetail.swift
//  Food Tracker
//
//  Created by Ben Cheng on 12/31/20.
//

import SwiftUI

struct ContactDetail: View {
    var contact: Contact
    
    var body: some View {
        Text(contact.jobTitle)
    }
}
