//
//  ContentView.swift
//  MovieToGo
//
//  Created by Artem Tkachenko on 12/2/24.
//

import SwiftUI

struct ContentView: View {
    @State var selectedTab: TabItem = .home
    
    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationView {
                HomeView()
            }
            .tabItem { TabItem.home.tabContent}
            .tag(TabItem.home)
        }
    }
}

#Preview {
    ContentView()
}
