//
//  EpisodesView.swift
//  BuildNetflixApp
//
//  Created by CHATCHAI LOKNIYOM on 2020/11/29.
//

import SwiftUI

struct EpisodesView: View {
    var episodes: [Episode]
    
    @Binding var showSeasonPicker: Bool
    @Binding var selectedSeason: Int
    
    func getEpisodes(forSeason season: Int) -> [Episode] {
        return episodes.filter { $0.season == season }
    }
    
    var body: some View {
        VStack {
            //Season picker
            HStack {
                Button(action: {
                    showSeasonPicker = true
                }, label: {
                    Group {
                        Text("Season 1")
                        Image(systemName: "chevron.down")
                    }
                    .font(.system(size: 16))
                    
                })
                
                Spacer()
            }
            
            //Episode list
            
            ForEach(getEpisodes(forSeason: selectedSeason)) { episode in
                Text("TEST")
            }
            
            Spacer()
        }
        .foregroundColor(.white)
    }
}

struct EpisodesView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            EpisodesView(episodes: allExampleEpisodes,
                         showSeasonPicker: .constant(false),
                         selectedSeason: .constant(1))
        }
        
    }
}
