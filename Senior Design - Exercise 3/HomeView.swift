/*
 Home page for app, viewed on launch
 Contains Home Page title text and hamburger button for Side Menu
 */

import SwiftUI

struct HomeView: View {
    // Control var for side menu
    @State private var showMenu = false

    var body: some View {
        NavigationStack {
            // Depth alignment
            ZStack(alignment: .topLeading) {
                // Vertical alignment
                VStack {
                    Text("Home Page")
                        .font(.largeTitle)
                        .bold()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding()

                // Hamburger button
                Button {
                    withAnimation(.easeInOut(duration: 0.25)) {
                        showMenu = true
                    }
                } label: {
                    Image(systemName: "line.3.horizontal")
                        .font(.title2)
                        .foregroundColor(.primary)
                        .padding()
                }

                SideMenu(isShowing: $showMenu)
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    HomeView()
}
