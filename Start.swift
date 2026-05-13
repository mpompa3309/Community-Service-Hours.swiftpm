//
//  Start.swift
//  Community Service Hours
//
//  Created by Vighnesh Manchikanti on 5/11/26.
//
import SwiftUI

struct Start: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                
                Spacer()
                
                Text("Community Service Tracker")
                    .font(.title)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, minHeight: 140)
                    .background(Color(.systemGray6))
                    .cornerRadius(14)
                    .padding(.horizontal)
                
                Text("Track your volunteer hours and goals.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, minHeight: 140)
                    .background(Color(.systemGray6))
                    .cornerRadius(14)
                    .padding(.horizontal)
                
                Spacer()
                
                NavigationLink {
                    ContentView()
                        .transition(.opacity)
                } label: {
                    Text("Start")
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding(.horizontal)
                }
                .buttonStyle(.plain)
                
                Spacer()
            }
            .animation(.easeInOut(duration: 0.2), value: UUID())
            .padding(.vertical)
            
            Link("Find community service hours", destination: URL(string: "https://www.fmsc.org")!)
                .font(.footnote)
                .foregroundColor(.blue)
                .padding(.top, 8)

        }
    }
}
