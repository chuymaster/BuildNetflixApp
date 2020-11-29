import Foundation

class HomeViewModel: ObservableObject {
    
    // String == Category
    @Published var movies: [String: [Movie]] = [:]
    
    var allCategories: [String] {
        movies.keys.map { String($0) }
    }
    
    func getMovie(forCategory category: String, andHomeRow homeRow: HomeTopRow) -> [Movie] {
        
        
        switch homeRow {
        case .home:
            return movies[category] ?? []
        case .movies:
            return (movies[category] ?? []).filter { $0.movieType == .movie }
        case .tvShows:
            return (movies[category] ?? []).filter { $0.movieType == .tvShow }
        case .myList:
            return movies[category] ?? [] // TODO: - setup mylist
        }
    }
    
    init() {
        setupMovies()
    }
    
    func setupMovies() {
        movies["Trending Now"] = exampleMovies
        movies["Stand-Up Comedy"] = exampleMovies.shuffled()
        movies["New Release"] = exampleMovies.shuffled()
        movies["Watch It Again"] = exampleMovies.shuffled()
        movies["Sci-Fi Movies"] = exampleMovies.shuffled()
    }
}
