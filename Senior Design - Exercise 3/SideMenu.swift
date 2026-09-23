/*
 Side menu that displays when hamburger button is pressed
 Contains navigation to all pages (Home, Second, Time)
 */
import SwiftUI

struct SideMenu: View {
    // control var for if menu is open/closed (showing/not showing)
    @Binding var isShowing: Bool

    var body: some View {
        
        ZStack(alignment: .leading) {
            // Dimmed background — tap to close
            if isShowing {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.25)) {
                            isShowing = false
                        }
                    }
            }

            // The menu panel itself
            HStack {
                VStack(alignment: .leading, spacing: 0) {
                    Text("Menu")
                        .font(.title)
                        .bold()
                        .padding(.top, 60)
                        .padding(.horizontal, 24)
                        .padding(.bottom, 30)

                    // Button for pages
                    MenuLink(destination: HomeView(), label: "Home", icon: "house.fill") {
                        isShowing = false
                    }
                    MenuLink(destination: SecondView(), label: "Second Page", icon: "2.circle.fill") {
                        isShowing = false
                    }
                    MenuLink(destination: TimeView(), label: "Time", icon: "clock.fill") {
                        isShowing = false
                    }
                    
                    Spacer()
                }
                // Menu frame
                .frame(width: 280)
                .frame(maxHeight: .infinity)
                .background(Color(.systemBackground))
                .shadow(radius: 8)
                .offset(x: isShowing ? 0 : -280)

                Spacer()
            }
        }
        .animation(.easeInOut(duration: 0.25), value: isShowing)
    }
}

// Reusable row for each menu link
struct MenuLink<Destination: View>: View {
    let destination: Destination
    let label: String
    let icon: String
    var onTap: () -> Void

    var body: some View {
        NavigationLink(destination: destination) {
            HStack(spacing: 16) {
                Image(systemName: icon)
                    .frame(width: 24)
                Text(label)
                    .font(.body)
            }
            .foregroundColor(.primary)
            .padding(.horizontal, 24)
            .padding(.vertical, 14)
        }
        .simultaneousGesture(TapGesture().onEnded {
            onTap()
        })
    }
}
