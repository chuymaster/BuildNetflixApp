import SwiftUI

struct PagerView<Content: View>: View {
    
    let pageCount: Int
    @Binding var currentIndex: Int
    @Binding var translation: CGFloat
    let content: Content // Any view is content
    
    init(pageCount: Int,
         currentIndex: Binding<Int>,
         translation: Binding<CGFloat>,
         @ViewBuilder content: () -> Content // Child view that this struct (PagerView) will render
    ) {
        self.pageCount = pageCount
        self._currentIndex = currentIndex
        self._translation = translation
        self.content = content()
    }
    
    var body: some View {
        GeometryReader { geo in
            HStack(spacing: 0) {
                content.frame(width: geo.size.width)
            }
            .frame(width: geo.size.width, alignment: .leading)
            .offset(x: -CGFloat(currentIndex) * geo.size.width)
            .offset(x: translation)
            .animation(.interactiveSpring())
            .gesture(DragGesture()
                        .onChanged({ value in
                            translation = value.translation.width // current scroll value
                        })
                        .onEnded({ value in
                            let offset = value.translation.width / geo.size.width
                            let newIndex = (CGFloat(currentIndex) - offset).rounded()
                            currentIndex = min(max(Int(newIndex), 0), pageCount - 1) // set limit for index
                            translation = 0
                        })
            )
        }
    }
}

struct PagerDummy: View {
    @State private var currentIndex: Int = 0
    @State private var translation: CGFloat = .zero
    
    var body: some View {
        PagerView(pageCount: 3, currentIndex: $currentIndex, translation: $translation) {
            Color.red
            Color.blue
            Color.black
        }
    }
}

struct PagerView_Previews: PreviewProvider {
    static var previews: some View {
        PagerDummy()
    }
}
