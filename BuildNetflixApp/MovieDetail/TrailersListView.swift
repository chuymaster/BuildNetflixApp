import SwiftUI

struct TrailersListView: View {
    
    var trailers: [Trailer]
    
    let screen = UIScreen.main.bounds
    
    var body: some View {
        VStack {
            ForEach(trailers) { trailer in
                VStack(alignment: .leading) {
                    VideoPreviewImage(imageUrl: trailer.thumbnailImageUrl, videoUrl: trailer.videoUrl)
                        .frame(maxWidth: screen.width)
                    
                    Text(trailer.name)
                        .font(.headline)
                }
                .foregroundColor(.white)
                .padding(.bottom, 10)
            }
        }
    }
}

struct TrailersListView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            TrailersListView(trailers: exampleTrailers)
        }
    }
}
