import SwiftUI

struct ComingSoonView: View {
    
    @State private var showNotificationList = false
    @State private var navBarHidden = true
    
    var body: some View {
        Group {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    VStack {
                        NotificationBar(showNotificationList: $showNotificationList)
                        
                        // for each loop of cells
                    }
                }
                .foregroundColor(.white)
            }
            // empty navigation trigger
            NavigationLink(
                destination: Text("Notification List"),
                isActive: $showNotificationList,
                label: {
                    EmptyView()
                })
                .navigationTitle("")
                .navigationBarHidden(navBarHidden)
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification), perform: { _ in
                    self.navBarHidden = true
                })
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification), perform: { _ in
                    self.navBarHidden = false
                })
        }
    }
}

struct ComingSoonView_Previews: PreviewProvider {
    static var previews: some View {
        ComingSoonView()
    }
}
