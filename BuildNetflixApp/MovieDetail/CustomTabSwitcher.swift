import SwiftUI

enum CustomTab: String, CaseIterable {
    case episodes = "EPISODES"
    case trailers = "TRAILERS & MORE"
    case more = "MORE LIKE THIS"
}

struct CustomTabSwitcher: View {
    
    @State private var currentTab: CustomTab = .episodes
    
    @Binding var showSeasonPicker: Bool
    @Binding var selectedSeason: Int
    
    var tabs: [CustomTab]
    var movie: Movie
    
    func widthForTab(_ tab: CustomTab) -> CGFloat {
        return tab.rawValue.widthOfString(usingFont: .systemFont(ofSize: 16, weight: .bold))
    }
    
    var body: some View {
          VStack {
              // Custom tab picker
              ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(tabs, id: \.self) { tab in
                        VStack {
                            // Red bar
                            Rectangle()
                                .frame(width: widthForTab(tab), height: 6)
                                .foregroundColor(currentTab == tab ? .red : .clear)
                            
                            // Button
                            Button(action: {
                                withAnimation {
                                    currentTab = tab
                                }
                            }, label: {
                                Text(tab.rawValue)
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(currentTab == tab ? .white : .gray)
                            })
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: widthForTab(tab), height: 30)
                            
                        }
                    }
                }
              }
              
            // Selected View
            switch currentTab {
            case .episodes:
                EpisodesView(episodes: movie.episodes ?? [],
                             showSeasonPicker: $showSeasonPicker,
                             selectedSeason: $selectedSeason)
            case .trailers:
                TrailersListView(trailers: movie.trailers)
            case .more:
                MoreLikeThisView(movies: movie.moreLikeThisMovies)
            
            }
          }
          .foregroundColor(.white)
    }
}


struct CustomTabSwitcher_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            CustomTabSwitcher(showSeasonPicker: .constant(false),
                              selectedSeason: .constant(1),
                              tabs: CustomTab.allCases,
                              movie: exampleMovie1)
        }
    }
}
