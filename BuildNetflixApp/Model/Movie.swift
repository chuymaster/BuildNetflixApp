import Foundation

struct Movie: Identifiable {
    var id: String
    var name: String
    var thumbnailUrl: URL
    
    var categories: [String]
    
    // For movie detail
    var year: Int
    var rating: String
    var numberOfSeasons: Int?
    
    var episodes: [Episode]?
    
    var promotionHeadline: String?
    
    var numberOfSeasonsDisplay: String {
        if let num = numberOfSeasons {
            if num == 1 {
                return "1 season"
            } else {
                return String(num) + " seasons"
            }
        }
        return ""
    }
}


