/*
 Time Page
 Displays current time
 */

import SwiftUI
public import Combine

struct TimeView: View {
    // Get current time from local info
    @State private var currentTime = Date()

    // create timer to update every second
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    // UI
    var body: some View {
        VStack(spacing: 16) {
            Text("Current Time")
                .font(.title2)
                .foregroundColor(.secondary)

            Text(timeString)
                .font(.system(size: 48, weight: .bold, design: .rounded))
                .monospacedDigit()
        }
        .padding()
        .navigationTitle("Time")
        
        // listens for timer refresh, updates current time
        .onReceive(timer) { newTime in
            currentTime = newTime
        }
    }

    // Formats as "h:mm a" -> e.g. "9:53 PM"
    private var timeString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        return formatter.string(from: currentTime)
    }
}

#Preview {
    NavigationStack {
        TimeView()
    }
}
