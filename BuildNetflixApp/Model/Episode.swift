import Foundation

struct Episode: Identifiable {
    var id = UUID().uuidString
    
    var name: String
    var season: Int
    var episodeNumber: Int
    var thumbnailImageUrlString: String
    var description: String
    var length: Int
    
    var videoUrl: URL
    
    var thumbnailImageUrl: URL {
        return URL(string: thumbnailImageUrlString)!
    }
}
