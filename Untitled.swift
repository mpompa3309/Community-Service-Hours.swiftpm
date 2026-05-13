//
//  Untitled.swift
//  Community Service Hours
//
//  Created by Vighnesh Manchikanti on 5/11/26.
//

import SwiftUI

struct TipsView: View {
    var body: some View {
        VStack(spacing: 25) {

            Text("Volunteer Tips")
                .font(.largeTitle)
                .fontWeight(.bold)

            VStack(alignment: .leading, spacing: 18) {

                Label("Arrive a few minutes early", systemImage: "clock")

                Label("Track hours after each session", systemImage: "checkmark.circle")

                Label("Be respectful and helpful", systemImage: "person.2")

                Label("Small hours add up over time", systemImage: "star")
            }
            .font(.headline)
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color(.systemGray6))
            .cornerRadius(15)

            Spacer()
        }
        .padding()
    }
}

