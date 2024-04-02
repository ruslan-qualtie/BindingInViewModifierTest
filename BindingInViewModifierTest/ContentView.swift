import SwiftUI

struct ContentView: View {
    @State private var hoverLocation: CGPoint?

    var body: some View {
        ZStack {
            Color.gray
            if let location = hoverLocation {
                Text("x: \(location.x) y: \(location.y)")
            }
        }
        .frame(width: 200, height: 200)
        .hoverLocation(value: $hoverLocation)
    }
}

#Preview {
    ContentView()
}
