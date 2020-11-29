import SwiftUI

struct HomeStack: View {
    
    var viewModel: HomeViewModel
    var topRowSelection: HomeTopRow
    var selectedGenre: HomeGenre
    
    @Binding var movieDetailToShow: Movie?
    
    var body: some View {
        ForEach(viewModel.allCategories, id: \.self) { category in
            HStack {
                Text(category)
                    .font(.title3)
                    .bold()
                Spacer()
            }
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(viewModel.getMovie(forCategory: category, andHomeRow: topRowSelection, andGenre: selectedGenre)) { movie in
                        StandardHomeMovie(movie: movie)
                            .frame(width: 100, height: 200)
                            .padding(.horizontal, 20)
                            .onTapGesture {
                                movieDetailToShow = movie
                            }
                    }
                }
            }
        }
    }
}

struct HomeStack_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                HomeStack(viewModel: HomeViewModel(),
                          topRowSelection: .movies, selectedGenre: .all,
                          movieDetailToShow: .constant(nil))
            }
            .foregroundColor(.white)
        }
    }
}
