import SwiftUI

struct ContentView: View {
    @State private var goalHours = ""
    @State private var completedHours = ""
    @State private var progressValue: Double = 0.0
    var body: some View {
        Text("Community Service Tracker")
        TextField("Goal hours", text: $goalHours)
    }
}
#Preview {
    ContentView()
}
