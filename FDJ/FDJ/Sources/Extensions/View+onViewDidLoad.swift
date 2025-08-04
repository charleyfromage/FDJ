import SwiftUI

extension View {
    func onLoad(perform action: @escaping () -> Void) -> some View {
        modifier(ViewDidLoadModifier(perform: action))
    }
}
