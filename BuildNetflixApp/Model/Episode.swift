import Foundation

struct Episode: Identifiable {
    var id = UUID().uuidString
    
    var name: String
    var season: Int
    var thumbnailImageUrlString: String
    var description: String
    var length: Int
    
    var thumbnailImageUrl: URL {
        return URL(string: thumbnailImageUrlString)!
    }
}
