import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        NavigationView {
            VStack {
                NavigationLink(destination: RoutineListView()) {
                    Image("EGGO")
                        .resizable()
                        .scaledToFit()
                }
                Text("Welcome to EGGO🐣")
                    .bold()
                    .font(.largeTitle)
            }
            
        }
        
    }
}
