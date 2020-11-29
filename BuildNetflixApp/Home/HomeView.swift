import SwiftUI

struct HomeView: View {
    
    let viewModel = HomeViewModel()
    
    let screen = UIScreen.main.bounds
    
    @State private var movieDetailToShow: Movie? = nil
    
    @State private var topRowSelection: HomeTopRow = .home
    @State private var homeGenre: HomeGenre = .all
    
    @State private var showGenreSelection = false
    @State private var showTopRowSelection = false
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    
                    TopRowButtons(topRowSelection: $topRowSelection,
                                  homeGenre: $homeGenre,
                                  showGenreSelection: $showGenreSelection,
                                  showTopRowSelection: $showTopRowSelection)
                    
                    TopMoviePreview(movie: exampleMovie5)
                        .frame(width: screen.width)
                        .padding(.top, screen.width / -3)
                        .zIndex(-1)
                    
                    ForEach(viewModel.allCategories, id: \.self) { category in
                        HStack {
                            Text(category)
                                .font(.title3)
                                .bold()
                            Spacer()
                        }
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack {
                                ForEach(viewModel.getMovie(forCategory: category)) { movie in
                                    StandardHomeMovie(movie: movie)
                                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        .padding(.horizontal, 20)
                                        .onTapGesture {
                                            movieDetailToShow = movie
                                        }
                                }
                            }
                        }
                    }
                }
                .foregroundColor(.white)
            }
            
            // Overlay
            if let movieDetailToShow = movieDetailToShow {
                MovieDetailView(movie: movieDetailToShow, movieDetailToShow: $movieDetailToShow)
                    .animation(.easeInOut)
                    .transition(.opacity)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct TopRowButtons: View {
    
    @Binding var topRowSelection: HomeTopRow
    @Binding var homeGenre: HomeGenre
    @Binding var showGenreSelection: Bool
    @Binding var showTopRowSelection: Bool
    
    var body: some View {
        
        switch topRowSelection {
        case .home:
            HStack {
                Button(action: {
                    topRowSelection = .home
                }, label: {
                    Image("netflix_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                })
                .buttonStyle(PlainButtonStyle())
                
                Spacer()
                
                Button(action: {
                    topRowSelection = .tvShows
                }, label: {
                    Text("TV Shows")
                })
                .buttonStyle(PlainButtonStyle())
                
                Spacer()
                
                Button(action: {
                    topRowSelection = .movies
                }, label: {
                    Text("Movies")
                })
                .buttonStyle(PlainButtonStyle())
                
                Spacer()
                
                Button(action: {
                    topRowSelection = .myList
                }, label: {
                    Text("My List")
                })
                .buttonStyle(PlainButtonStyle())
            }
            .padding(.leading, 10)
            .padding(.trailing, 30)
        case .myList, .tvShows, .movies:
            HStack {
                Button(action: {
                    topRowSelection = .home
                }, label: {
                    Image("netflix_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                })
                .buttonStyle(PlainButtonStyle())
                
                HStack(spacing: 20) {
                    Button(action: {
                        showTopRowSelection = true
                    }, label: {
                        HStack {
                            Text(topRowSelection.rawValue)
                                .font(.system(size: 18))
                            Image(systemName: "triangle.fill")
                                .font(.system(size: 10))
                                .rotationEffect(.degrees(180), anchor: .center)
                        }
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    Button(action: {
                        showGenreSelection = true
                    }, label: {
                        HStack {
                            Text(homeGenre.rawValue)
                                .font(.system(size: 12))
                            Image(systemName: "triangle.fill")
                                .font(.system(size: 6))
                                .rotationEffect(.degrees(180), anchor: .center)
                        }
                    })
                    .buttonStyle(PlainButtonStyle())
                }
                .padding(.leading, 10)
                
                
                Spacer()
                
            }
            .padding(.leading, 10)
            .padding(.trailing, 30)
        }
        
    }
}

enum HomeTopRow: String, CaseIterable {
    case home = "Home"
    case tvShows = "TV Shows"
    case movies = "Movies"
    case myList = "My List"
}

enum HomeGenre: String, CaseIterable {
    case all = "All Genres"
    case action = "Action"
    case comedy = "Comedy"
    case horror = "Horror"
    case thriller = "Thriller"
}
