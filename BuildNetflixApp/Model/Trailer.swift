import Foundation

struct Trailer: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var name: String
    var videoUrl: URL
    var thumbnailImageUrl: URL
}
