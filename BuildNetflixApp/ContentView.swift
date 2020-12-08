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
    @State private var previewNewPos: CGFloat = 1000
    
    @State private var previewHorizontalDragActive: Bool = false
    
    init() {
        // need to use UIKit
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = .black
    }
    
    var body: some View {
        
        let previewDragGesture = DragGesture(minimumDistance: 20)
            .onChanged { value in
                // PagerView is dragging. So don't do anything here
                if previewHorizontalDragActive {
                    return
                }
                
                if previewCurrentPos == .zero {
                    if abs(value.translation.width) > abs(value.translation.height) {
                        previewHorizontalDragActive = true
                        return
                    }
                }
                
                // VERTICAL ONLY
                let shouldBePosition = value.translation.height + previewNewPos
                
                if shouldBePosition < 0 {
                    return // Up direction
                } else {
                    previewCurrentPos = shouldBePosition
                }
            }
            .onEnded { value in
                if previewHorizontalDragActive {
                    previewHorizontalDragActive = false
                    return
                }
                
                let shouldBePosition = value.translation.height + previewNewPos
                
                if shouldBePosition < 0 {
                    previewCurrentPos = .zero
                    previewNewPos = .zero
                } else {
                    let closingPoint = UIScreen.main.bounds.height * 0.2
                    if shouldBePosition > closingPoint {
                        withAnimation {
                            showPreviewFullScreen = false
                            previewCurrentPos = UIScreen.main.bounds.height + 20
                            previewNewPos = UIScreen.main.bounds.height + 20
                        }
                    } else {
                        withAnimation {
                            previewCurrentPos = .zero
                            previewNewPos = .zero
                        }
                    }
                    
                    previewHorizontalDragActive = false
                }
            }
        
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
                isVisible: $showPreviewFullScreen,
                externalDragGesture: previewDragGesture)
                .offset(y: previewCurrentPos)
                .isHidden(!showPreviewFullScreen)
                .animation(.easeIn)
                .transition(.move(edge: .bottom))
        }
        .onChange(of: showPreviewFullScreen, perform: { value in
            if value {
                // show fullscreen
                withAnimation {
                    previewCurrentPos = .zero
                    previewNewPos = .zero
                }
            } else {
                // hide under screen height
                withAnimation {
                    previewCurrentPos = UIScreen.main.bounds.height + 20
                    previewNewPos = UIScreen.main.bounds.height + 20
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
