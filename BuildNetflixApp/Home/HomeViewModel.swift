import Foundation

class HomeViewModel: ObservableObject {
    
    // String == Category
    @Published var movies: [String: [Movie]] = [:]
    
    var allCategories: [String] {
        movies.keys.map { String($0) }
    }
    
    func getMovie(forCategory category: String) -> [Movie] {
        return movies[category] ?? []
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
