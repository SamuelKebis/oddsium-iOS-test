//
//  DashboardTabView.swift
//  
//
//  Created by Samuel Kebis on 27/01/2023.
//

import SwiftUI

struct DashboardTabView: View {
    @State private var selection = 1
    
    var body: some View {
        TabView(selection: $selection) {
            Text("My Bets").tabItem {
                Image(systemName: "checkmark.square")
                    .symbolVariant(.none)
                Text("My Bets")
            }
            .tag(0)
            
            Text("All Matches").tabItem {
                Image(systemName: "globe")
                Text("All Matches")
            }
            .tag(1)
            
            Text("Menu").tabItem {
                Text("Menu")
            }
            .tag(2)
            
            Text("Calendar").tabItem {
                Image(systemName: "calendar")
                Text("Calendar")
            }
            .tag(3)
            
            Text("Favourites").tabItem {
                Image(systemName: "star")
                Text("Favourites")
            }
            .tag(4)
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardTabView()
    }
}
