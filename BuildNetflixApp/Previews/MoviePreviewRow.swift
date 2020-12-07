//
//  MoviePreviewRow.swift
//  BuildNetflixApp
//
//  Created by CHATCHAI LOKNIYOM on 2020/12/05.
//

import SwiftUI

struct MoviePreviewRow: View {
    var movies: [Movie]
    
    @Binding var showPreviewFullScreen: Bool
    @Binding var previewStartingIndex: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Previews")
                .font(.title3)
                .bold()
                .foregroundColor(.white)
                .padding(.leading, 6)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(0..<movies.count) { movieIndex in
                        let movie = movies[movieIndex]
                        
                        MoviePreviewCell(movie: movie)
                            .frame(width: 120, height: 120)
                            .padding(.leading, 6)
                            .padding(.trailing, 14)
                            .onTapGesture {
                                previewStartingIndex = movieIndex
                                showPreviewFullScreen = true
                            }
                    }
                }
            }
        }
        .frame(height: 185)
    }
}

struct MoviePreviewRow_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            MoviePreviewRow(movies: exampleMovies,
                            showPreviewFullScreen: .constant(false),
                            previewStartingIndex: .constant(0))
        }
    }
}
