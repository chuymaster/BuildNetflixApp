import Foundation

struct Movie: Identifiable {
    var id: String
    var name: String
    var thumbnailUrl: URL
    
    var categories: [String]
    var genre: HomeGenre = .all
    
    // For movie detail
    var year: Int
    var rating: String
    var numberOfSeasons: Int?
    
    // Personalization
    var currentEpisode: CurrentEpisodeInfo?
    var defaultEpisodeInfo: CurrentEpisodeInfo
    var creators: String
    var cast: String
    
    var moreLikeThisMovies: [Movie]
    
    var episodes: [Episode]?
    
    var promotionHeadline: String?
    
    var trailers: [Trailer]
    
    var previewImageName: String
    var previewVideoURL: URL?
    
    // MARK: - Computed variables
    
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
    
    var episodeInfoDisplay: String {
        if let current = currentEpisode {
            return "S\(current.season):E\(current.episode) \(current.episodeName)"
        } else {
            let current = defaultEpisodeInfo
            return "S\(current.season):E\(current.episode) \(current.episodeName)"
        }
    }
    
    var episodeDescriptionDisplay: String {
        if let current = currentEpisode {
            return current.description
        } else {
            return defaultEpisodeInfo.description
        }
    }
    
    var movieType: MovieType {
        return episodes == nil ? .movie : .tvShow
    }
}

struct CurrentEpisodeInfo: Hashable, Equatable {
    var episodeName: String
    var description: String
    var season: Int
    var episode: Int
}

enum MovieType {
    case movie
    case tvShow
}
