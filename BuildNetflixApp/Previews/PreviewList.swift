import SwiftUI

struct PreviewList: View {
    
    var movies: [Movie]
    
    // information public for other views
    @Binding var currentSelection: Int
    @Binding var isVisible: Bool
    
    // information only in this view
    @State private var currentTranslation: CGFloat = 0
    
    let externalDragGesture: _EndedGesture<_ChangedGesture<DragGesture>>
    
    let screen = UIScreen.main.bounds
    
    func shouldPlayVideo(index: Int) -> Bool {
        if !isVisible {
            return false
        }
        if index != currentSelection {
            return false
        }
        return true
    }
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            PagerView(
                pageCount: movies.count,
                currentIndex: $currentSelection,
                translation: $currentTranslation,
                externalDragGesture: externalDragGesture) {
                
                ForEach(0..<movies.count) { index in
                    let movie = movies[index]
                    
                    PreviewView(
                        viewModel: PreviewViewModel(movie: movie),
                        playVideo: shouldPlayVideo(index: index))
                        .frame(width: screen.width)
                }
            }
            .frame(width: screen.width)
        }
    }
}

//struct ExamplePreviewList: View {
//
//    @State var currentSelection: Int = 0
//    @State var isVisible: Bool = true
//
//    var body: some View {
//        PreviewList(
//            movies: exampleMovies,
//            currentSelection: $currentSelection,
//            isVisible: $isVisible)
//    }
//}
//
//struct PreviewList_Previews: PreviewProvider {
//    static var previews: some View {
//        ExamplePreviewList()
//    }
//}
