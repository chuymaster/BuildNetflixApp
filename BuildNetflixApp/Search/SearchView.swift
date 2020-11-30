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
    
    @State private var movieDetailToShow: Movie? = nil
    
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
                        PopularList(movieDetailToShow: $movieDetailToShow,
                                    movies: viewModel.popularMovies)
                    }
                    
                    if viewModel.viewState == .empty {
                        Text("Your search did not have any results")
                            .bold()
                            .padding(.top, 150)
                    } else if viewModel.viewState == .ready && !viewModel.isShowingPopularMovies {
                        Text("Search Result")
                    }
                }
                
                Spacer()
            }
            
            if movieDetailToShow != nil {
                MovieDetailView(movie: movieDetailToShow!, movieDetailToShow: $movieDetailToShow)
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

struct PopularList: View {
    
    @Binding var movieDetailToShow: Movie?
    var movies: [Movie]
    
    var body: some View {
        VStack {
            HStack {
                Text("Popular Searches")
                    .bold()
                    .font(.title3)
                    .padding(.leading, 12)
            }
            
            LazyVStack {
                ForEach(movies, id: \.id) { movie in
                    PopularMovieView(movieDetailToShow: $movieDetailToShow, movie: movie)
                        .frame(height: 75)
                }
            }
        }
    }
}
