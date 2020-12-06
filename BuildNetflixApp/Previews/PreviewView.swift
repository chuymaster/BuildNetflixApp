import SwiftUI

struct PreviewView: View {
    
    @ObservedObject var viewModel: PreviewViewModel
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            TrailerPlayerView(
                videoUrl: viewModel.movie.trailers.first?.videoUrl,
                playVideo: .constant(true))
            
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 0, content: {
                        Text(viewModel.movie.name)
                            .bold()
                            .font(.largeTitle)
                    })
                    
                    Spacer()
                }
                .padding(.leading, 20)
                .padding(.top, 60)
                
                Spacer()
                
                HStack {
                    ForEach(0..<viewModel.movie.categories.count) { index in
                        let category = viewModel.movie.categories[index]
                        HStack {
                            Text(category)
                                .font(.footnote)
                            
                            if index != viewModel.movie.categories.count - 1 {
                                Image(systemName: "circle.fill")
                                    .font(.system(size: 3))
                            }
                        }
                    }
                }
                
                HStack {
                    Spacer()
                    SmallVerticalButton(text: "My List", isOnImage: "checkmark", isOffImage: "plus", color: viewModel.movie.accentColor ?? .white, isOn: true) {
                        //
                    }
                    
                    Spacer()
                    Button(action: {}, label: {
                        HStack {
                            Image(systemName: "arrowtriangle.right.fill")
                            Text("PLAY")
                                .fontWeight(.heavy)
                        }
                        .padding(.vertical, 12)
                        .padding(.horizontal, 26)
                        .border(viewModel.movie.accentColor ?? .white, width: 3)
                    })
                    
                    Spacer()
                    SmallVerticalButton(text: "Info", isOnImage: "info.circle", isOffImage: "info.circle", color: viewModel.movie.accentColor ?? .white, isOn: true) {
                        //
                    }
                    Spacer()
                }
                .padding(.vertical, 14)
            }
            .padding(.bottom, 48)
            .foregroundColor(viewModel.movie.accentColor)
        }
        .edgesIgnoringSafeArea(.vertical)
    }
}

struct PreviewView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView(viewModel: PreviewViewModel(movie: exampleMovie1))
    }
}
