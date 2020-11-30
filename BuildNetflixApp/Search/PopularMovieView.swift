import KingfisherSwiftUI
import SwiftUI

struct PopularMovieView: View {
    
    @Binding var movieDetailToShow: Movie?
    
    var movie: Movie
    
    var body: some View {
        GeometryReader { proxy in
            HStack {
                KFImage(movie.thumbnailUrl)
                    .resizable()
                    .frame(width: proxy.size.width / 3)
                    .padding(.leading, 3)
                
                Text(movie.name)
                
                Spacer()
                
                Button(action: {
                    // play movie
                }
                , label: {
                    Image(systemName: "arrowtriangle.right.fill")
                })
                .padding(.trailing, 20)
            }
            .foregroundColor(.white)
            .onTapGesture {
                movieDetailToShow = movie
            }
        }
    }
}

struct PopularMovieView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            PopularMovieView(movieDetailToShow: .constant(nil), movie: exampleMovie1)
                .frame(height: 75)
        }
        
    }
}
