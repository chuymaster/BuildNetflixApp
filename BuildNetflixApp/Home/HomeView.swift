import SwiftUI

struct HomeView: View {
    
    let viewModel = HomeViewModel()
    
    let screen = UIScreen.main.bounds
    
    @State private var movieDetailToShow: Movie? = nil
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    
                    TopRowButtons()
                    
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
    var body: some View {
        HStack {
            Button(action: {}, label: {
                Image("netflix_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
            })
            .buttonStyle(PlainButtonStyle())
            
            Spacer()
            
            Button(action: {}, label: {
                Text("TV Shows")
            })
            .buttonStyle(PlainButtonStyle())
            
            Spacer()
            
            Button(action: {}, label: {
                Text("Movies")
            })
            .buttonStyle(PlainButtonStyle())
            
            Spacer()
            
            Button(action: {}, label: {
                Text("My List")
            })
            .buttonStyle(PlainButtonStyle())
        }
        .padding(.leading, 10)
        .padding(.trailing, 30)
    }
}
