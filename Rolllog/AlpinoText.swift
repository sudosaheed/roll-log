import SwiftUI

struct AlpinoText: View {
    let text: String
    let size: CGFloat
    // One single shared place that knows how to render Alpino-Black text. Both WelcomeView
    // and LandingView will call THIS instead of writing out .font(.custom(...)) separately.
    // so there's only one place this can ever go wrong, not two.

    var body: some View {
        Text(text)
            .font(.custom("Alpino-Black", size: size))
    }
}
