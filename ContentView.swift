import SwiftUI

struct ContentView: View {
    @AppStorage("goalHours") private var goalHours = ""
    @AppStorage("completedHours") private var completedHours = ""
   @State private var progressValue: Double = 0.0
   @State private var progressMessage = "0%"
    
    var body: some View{
        VStack(spacing: 20){
            Text("Community Service Tracker")
                .font(.title)
            
            TextField("Goal hours", text: $goalHours)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.decimalPad)
            
            TextField("Completed hours", text: $completedHours)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.decimalPad)
            
            Button("Calculate Progress"){
                updateProgress()
            }
            
            Text("Progress: \(progressMessage)")

            ProgressView(value: progressValue)

        }
        .padding()
        
        .onAppear {
            updateProgress()
        }
    }
    
    func updateProgress(){
        // convert strings to numbers
        let goal = Double(goalHours) ?? 0.0
        let completed = Double(completedHours) ?? 0.0
       
        // function guard to prevent division by zero... needed or it will break
        guard goal > 0 else{
            progressValue = 0.0
            progressMessage = "0% (set a goal first)"
            return
        }
        
        // calc vars
        let raw = completed / goal
        progressValue = min(max(raw, 0), 1)
        
        let percent = Int(progressValue * 100)
        progressMessage = "\(percent)%"
    }
}

#Preview {
    ContentView()
}
