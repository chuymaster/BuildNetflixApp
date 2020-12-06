import SwiftUI
import VideoPlayer

struct TrailerPlayerView: View {
    
    var videoUrl: URL?
    
    @Binding var playVideo: Bool
    
    var body: some View {
        if let videoUrl = videoUrl {
            VideoPlayer(url: videoUrl, play: $playVideo)
        } else {
            Text("Could not load video")
        }
    }
}

struct TrailerPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        TrailerPlayerView(videoUrl: nil, playVideo: .constant(true))
    }
}
