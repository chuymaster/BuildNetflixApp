import Foundation
import SwiftUI

class SearchViewModel: ObservableObject {
    
    @Published var isLoading: Bool = false
    
    @Published var viewState: ViewState = .ready
    
    @Published var popularMovies: [Movie] = []
    @Published var searchResults: [Movie] = []
    
    @Published var isShowingPopularMovies = true
    
    init() {
        getPopularMovies()
    }
    
    func updateSearchText(with text: String) {
        setViewState(to: .loading)
        
        if text.count > 0 {
            isShowingPopularMovies = false
            getSearchResults(forText: text)
        } else {
            isShowingPopularMovies = true
        }
    }
    
    private func getPopularMovies() {
        self.popularMovies = generateMovies(40)
    }
    
    private func getSearchResults(forText text: String) {
        
        let haveResult = Int.random(in: 0...3)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if haveResult == 0 {
                // empty view for not found result
                self.searchResults = []
                self.setViewState(to: .empty)
            } else {
                self.searchResults = generateMovies(21)
                self.setViewState(to: .ready)
            }
        }
    }
    
    // Keep parameters in sync
    private func setViewState(to state: ViewState) {
        DispatchQueue.main.async {
            self.viewState = state
            self.isLoading = state == .loading
        }
    }
}

enum ViewState {
    case empty
    case loading
    case ready
    case error
}
