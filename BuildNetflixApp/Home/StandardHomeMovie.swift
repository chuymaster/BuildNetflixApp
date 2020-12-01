import SwiftUI
import KingfisherSwiftUI

struct StandardHomeMovie: View {
    let movie: Movie
    
    var body: some View {
        GeometryReader { proxy in
            KFImage(movie.thumbnailUrl)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: proxy.size.width, height: proxy.size.height)
                .clipped()
        }
        
    }
}

struct StandardHomeMovie_Previews: PreviewProvider {
    static var previews: some View {
        StandardHomeMovie(movie: exampleMovie1)
            .frame(width: 200, height: 300)
    }
}
