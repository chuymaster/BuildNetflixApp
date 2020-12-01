//
//  ContentView.swift
//  BuildNetflixApp
//
//  Created by CHATCHAI LOKNIYOM on 2020/11/28.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        // need to use UIKit
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = .black
    }
    
    var body: some View {
        
        TabView {
            HomeView()
                .tabItem {
                    Group {
                        Image(systemName: "house")
                        Text("Home")
                    }
                }.tag(0)
            
            SearchView()
                .tabItem {
                    Group {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                }.tag(1)
            
            Text("Coming Soon")
                .tabItem {
                    Group {
                        Image(systemName: "play.rectangle")
                        Text("Coming Soon")
                    }
                }.tag(2)
            
            Text("Downloads")
                .tabItem {
                    Group {
                        Image(systemName: "arrow.down.to.line.alt")
                        Text("Downloads")
                    }
                }.tag(3)
            
            Text("More")
                .tabItem {
                    Group {
                        Image(systemName: "equal")
                        Text("More")
                    }
                }.tag(4)
        }
        .accentColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
