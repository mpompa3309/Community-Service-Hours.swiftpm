import SwiftUI
import Foundation

struct ContentView: View {
    @AppStorage("goalHours") private var goalHours = ""
    @AppStorage("completedHours") private var completedHours = ""
    @State private var progressValue: Double = 0.0
    @State private var progressMessage = "0%"
    
    var body: some View {
        VStack{
            Text("Community Service Tracker")
            TextField("Goal hours", text: $goalHours)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.decimalPad)
            
            TextField("Completed hours", text: $completedHours)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.decimalPad)
            
        }
        .padding()
}
    func updateProgress(){
        let goal = Double(goalHours) ?? 0.0
        let completed = Double(completedHours) ?? 0.0
        
    }
    
    }

     
#Preview {
    ContentView()
}
