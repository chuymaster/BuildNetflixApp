//
//  SearchView.swift
//  BuildNetflixApp
//
//  Created by CHATCHAI LOKNIYOM on 2020/11/30.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject var viewModel = SearchViewModel()
    @State var searchText: String = ""
    
    var body: some View {
        
        // Custom binding to observe new text and call viewModel.update()
        let searchTextBinding = Binding {
            return searchText
        } set: {
            searchText = $0 // new value
            viewModel.updateSearchText(with: $0)
        }
        
        return ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                // searchTextBinding no need for $ because we access Binding.
                // @State is a wrapper. Binding requires $ but searchTextBinding is already Binding.
                SearchBar(text: searchTextBinding, isLoading: $viewModel.isLoading)
                    .padding()
                
                ScrollView() {
                    if viewModel.isShowingPopularMovies {
                        Text("Popular")
                    } else {
                        
                    }
                    
                    if viewModel.viewState == .empty {
                        Text("Empty")
                    } else if viewModel.viewState == .ready && !viewModel.isShowingPopularMovies {
                        Text("Search Result")
                    }
                }
                
                Spacer()
            }
        }
        .foregroundColor(.white)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
