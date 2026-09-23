/*
 Second Page
 Text box prompt for user name with feedback message on submission
 */

import SwiftUI

struct SecondView: View {
    // vars for text I/O
    @State private var name = ""
    @State private var greeting = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Second Page")
                .font(.largeTitle)
                .bold()
            
            // Input field
            TextField("Enter your name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .submitLabel(.done)
                .onSubmit {
                    submit()
                }
            
            // Submit Button
            Button {
                submit()
            } label: {
                Text("Submit")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .contentShape(Rectangle())
            }
            .disabled(name.trimmingCharacters(in: .whitespaces).isEmpty)

            // Only update text if not empty
            if !greeting.isEmpty {
                Text(greeting)
                    .font(.title2)
                    .fontWeight(.medium)
                    .transition(.opacity)
            }

        }
        .padding()
        .navigationTitle("Second")
        .animation(.easeInOut, value: greeting)
    }
    
    // Run on submit
    private func submit() {
        let trimmed = name.trimmingCharacters(in: .whitespaces)
        guard !trimmed.isEmpty else { return }
        greeting = "Hello, \(trimmed)!"
    }
}

#Preview {
    NavigationStack {
        SecondView()
    }
}
