import SwiftUI

struct ContentView: View {
    @State private var goalHours = ""
    @State private var completedHours = ""
    @State private var progressValue: Double = 0.0
    var body: some View {
        VStack{
            Text("Community Service Tracker")
            TextField("Goal hours", text: $goalHours)
                .textFieldStyle(.roundedBorder)
            
            TextField("Completed hours", text: $completedHours)
                .textFieldStyle(.roundedBorder)
        }
        .padding()
}
    }
     
#Preview {
    ContentView()
}
