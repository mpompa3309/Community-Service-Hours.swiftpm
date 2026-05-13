import SwiftUI

struct ContentView: View {
    @AppStorage("goalHours") private var goalHours = ""
    @AppStorage("completedHours") private var completedHours = ""
    // save deadline date
    @AppStorage("savedDeadline") private var savedDeadline =
    Date().timeIntervalSince1970
    @State private var progressValue: Double = 0.0
    @State private var progressMessage = "0%"
    @State private var deadlineMessage = ""
    
    var body: some View{
        ZStack{
            
            Color(.systemBackground)
                .ignoresSafeArea()
            VStack(spacing: 25){
                Text("Community Service Tracker")
                    .font(.headline)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(15)
                
                Text("Track your volunteer hours")
                    .foregroundColor(.gray)
                    .font(.title3)
                
                TextField("Goal hours", text: $goalHours)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.decimalPad)
                    .font(.headline)
                    .padding()
                    .cornerRadius(15)
                
                TextField("Completed hours", text: $completedHours)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.decimalPad)
                    .font(.headline)
                    .padding()
                    .cornerRadius(15)
                // deadline picker
                DatePicker(
                    "Goal Deadline",selection: Binding (
                        
                        get: {
                            Date(timeIntervalSince1970: savedDeadline)},set: { newDate in savedDeadline = newDate.timeIntervalSince1970}),displayedComponents: .date)
                .font(.headline)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(15)
                
                Button("Calculate Progress"){
                    updateProgress()
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                
                Text("Progress: \(progressMessage)")
                    .font(.headline)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(15)
                                
                ProgressView(value: progressValue)
                    .frame(width: 390, height: 20)
                    .scaleEffect(x: 1, y: 5, anchor: .center)
                    .clipShape(Capsule())
                                
                                // deadline result text
                    Text(deadlineMessage)
                    .font(.headline)
                    .padding()
                    .background(Color(.orange))
                    .cornerRadius(15)
                    .multilineTextAlignment(.center)
                                
                                Spacer()
                            }            .tint(.blue)
            
            
            Spacer()
            
                .onAppear {
                    updateProgress()
                }
        }
    }
    
    func updateProgress() {
        
        // convert strings to numbers
        let goal = Double(goalHours) ?? 0.0
        let completed = Double(completedHours) ?? 0.0
        
        // prevent division by zero
        guard goal > 0 else {
            progressValue = 0.0
            progressMessage = "0% (set a goal first)"
            deadlineMessage = ""
            return
        }
        
        // progress calculation
        let raw = completed / goal
        progressValue = min(max(raw, 0), 1)
        
        let percent = Int(progressValue * 100)
        progressMessage = "\(percent)%"
        
        // deadline check
        let deadlineDate = Date(timeIntervalSince1970: savedDeadline)
        let today = Date()
        
        let calendar = Calendar.current
        let daysLeft = calendar.dateComponents([.day],
                                               from: today,
                                               to: deadlineDate).day ?? 0
        
        // if goal completed
               if completed >= goal {
                   deadlineMessage = "Goal completed!"
               }
               else {
                   // before deadline
                   if daysLeft >= 0 {
                       deadlineMessage = "\(daysLeft) days left to finish your goal"
                   }
                   // after deadline
                   else {
                       deadlineMessage = "\(abs(daysLeft)) days overdue"
                   }
               }
           }
       }

       #Preview {
           ContentView()
       }
