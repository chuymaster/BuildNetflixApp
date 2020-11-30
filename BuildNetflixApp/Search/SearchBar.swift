import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String
    @Binding var isLoading: Bool
    
    @State private var isEditing = true
    
    var body: some View {
        ZStack(alignment: .leading) {
            Color.graySearchBackground
                .frame(width: 280, height: 36)
                .cornerRadius(8)
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color.graySearchText)
                    .padding(.leading, 10)
                
                TextField("Search", text: $text)
                    .padding(7)
                    .padding(.leading, -7)
                    .background(Color.graySearchBackground)
                    .cornerRadius(8)
                    .foregroundColor(.white)
                    .padding(7)
                    .onTapGesture(perform: {
                        isEditing = true
                    })
                    .animation(.default)
                
                if !text.isEmpty {
                    if isLoading {
                        Button(action: {
                            // clear text
                            text = ""
                        }, label: {
                            ActivityIndicator(style: .medium, animate: .constant(true))
                                .configure {
                                    $0.color = .white
                                }
                        })
                        .padding(.trailing, 32)
                        .frame(width: 35, height: 35)
                    } else {
                        Button(action: {
                            // clear text
                            text = ""
                        }, label: {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.graySearchText)
                                .frame(width: 35, height: 35)
                        })
                        .padding(.trailing, 10)
                    }
                }
                
                if isEditing {
                    Button(action: {
                        // clear text
                        text = ""
                        
                        // hide both buttons
                        isEditing = false
                        
                        // give up first-responder
                        hideKeyboard()
                    }, label: {
                        Text("Cancel")
                    })
                    .foregroundColor(.white)
                    .padding(.trailing, 10)
                    .transition(.move(edge: .trailing))
                    .animation(.default)
                    
                }
                
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            SearchBar(text: .constant(""), isLoading: .constant(false))
                .padding()
        }
        
    }
}
