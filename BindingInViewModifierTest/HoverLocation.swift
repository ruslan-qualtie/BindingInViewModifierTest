import SwiftUI

struct HoverLocation: ViewModifier {
    @Binding public var value: CGPoint?
    
    func body(content: Content) -> some View {
        content.overlay {
            GeometryReader { geometryProxy in
                Rectangle()
                    .fill(.clear)
                    .contentShape(Rectangle())
                    .onContinuousHover { hoverPhase in
                        switch hoverPhase {
                        case .active(let hoverLocation):
                            value = hoverLocation
                        case .ended:
                            value = nil
                        }
                    }
            }
        }
    }
}

extension View {
    func hoverLocation(value: Binding<CGPoint?>) -> some View {
        modifier(HoverLocation(value: value))
    }
}
