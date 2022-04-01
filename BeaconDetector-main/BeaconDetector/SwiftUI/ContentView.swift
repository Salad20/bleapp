
import SwiftUI

struct Standard: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.system(size: 15))
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .foregroundColor(Color.white)
    }
}


struct ContentView: View {
    @ObservedObject var detector = Detector()
 
    
    
    var body: some View {
        
        VStack {
            VStack(spacing: 0) {
                
            }
            
            
            Spacer()
            
            //MARK: - Beacon Details
            VStack {
                Text("BEACON DETAILS")
                    .modifier(Standard())
                Text("UUID: \(K.uuid)")
                    .font(Font.system(size: 12, design: .rounded))
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .foregroundColor(Color.white)
                Text("RSSID: \(detector.RSSID)")
                    .modifier(Standard())
                Text("Distance: \(pow(10, Double((-57-detector.RSSID))/(13.28)))")
                    .modifier(Standard())
                Text("Beacon Status:  \(detector.lastDistance)")
                    .font(Font.system(size: 15, design: .rounded))
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .foregroundColor(Color.white)
                    .background(detector.bgColor)
            }
            .frame(maxHeight: 120)
            .background(Color("DefaultColor"))
        }
        .alert(isPresented: $detector.showAlert) {
            Alert(title: Text(K.alert), message: Text(detector.alert), dismissButton: .default(Text(K.ok)))
        }
        
        Spacer()
                    }
    }



#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPhone 12 Pro Max")
            ContentView()
        }
    }
}
#endif
