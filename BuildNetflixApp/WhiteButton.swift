import SwiftUI

struct WhiteButton: View {
    
    var image: String
    var text: String
    
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
            .foregroundColor(.black)
            .background(Color.white)
            .cornerRadius(3)
        })
    }
}

struct WhiteButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            WhiteButton(image: "play.fill", text: "Play", action: {})
        }
        .padding()
    }
}
