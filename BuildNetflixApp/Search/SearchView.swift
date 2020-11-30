//
//  SearchView.swift
//  BuildNetflixApp
//
//  Created by CHATCHAI LOKNIYOM on 2020/11/30.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject var viewModel = SearchViewModel()
    @State var text: String = ""
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                SearchBar(text: $text, isLoading: $viewModel.isLoading)
                
                Spacer()
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
