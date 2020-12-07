//
//  ContentView.swift
//  BuildNetflixApp
//
//  Created by CHATCHAI LOKNIYOM on 2020/11/28.
//

import SwiftUI

struct ContentView: View {
    
    @State var showPreviewFullScreen = false
    @State var previewStartingIndex: Int = 0
    
    @State private var previewCurrentPos: CGFloat = 1000
    
    init() {
        // need to use UIKit
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = .black
    }
    
    var body: some View {
        
        ZStack {
            TabView {
                HomeView(
                    showPreviewFullScreen: $showPreviewFullScreen,
                    previewStartingIndex: $previewStartingIndex)
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
                
                ComingSoonView()
                    .tabItem {
                        Group {
                            Image(systemName: "play.rectangle")
                            Text("Coming Soon")
                        }
                    }.tag(2)
                
                DownloadsView()
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
            
            PreviewList(
                movies: exampleMovies,
                currentSelection: $previewStartingIndex,
                isVisible: $showPreviewFullScreen)
                .offset(y: previewCurrentPos)
                .isHidden(!showPreviewFullScreen)
                .animation(.easeIn)
                .transition(.move(edge: .bottom))
        }
        .onChange(of: showPreviewFullScreen, perform: { value in
            if value {
                // show fullscreen
                withAnimation {
                    self.previewCurrentPos = .zero
                }
            } else {
                // hide under screen height
                withAnimation {
                    self.previewCurrentPos = UIScreen.main.bounds.height + 20
                }
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
