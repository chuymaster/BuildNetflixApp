//
//  MoreLikeThisView.swift
//  BuildNetflixApp
//
//  Created by CHATCHAI LOKNIYOM on 2020/11/29.
//

import SwiftUI

struct MoreLikeThisView: View {
    
    var movies: [Movie]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(0..<movies.count) { index in
                    StandardHomeMovie(movie: movies[index])
                }
            }
        }
    }
}

struct MoreLikeThisView_Previews: PreviewProvider {
    static var previews: some View {
        MoreLikeThisView(movies: exampleMovies)
    }
}
