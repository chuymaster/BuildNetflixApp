import SwiftUI

struct PlayButton: View {
    
    var image: String
    var text: String
    var backgroundColor: Color = .white
    
    var action: () -> Void
    
    
    var body: some View {
        Button(action: action, label: {
            HStack {
                Spacer()
                
                Image(systemName: image)
                    .font(.headline)
                
                Text(text)
                    .font(.system(size: 16))
                    .bold()
                
                Spacer()
            }
            .padding(.vertical, 6)
            .foregroundColor(backgroundColor == .white ? .black : .white)
            .background(backgroundColor)
            .cornerRadius(3)
        })
    }
}

struct WhiteButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            PlayButton(image: "play.fill", text: "Play", action: {})
        }
        .padding()
    }
}
