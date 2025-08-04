import SwiftUI

struct CardView: View {
    private var item: CardViewItem

    private var backgroundView: some View {
        RoundedRectangle(cornerRadius: Spacing.large)
            .fill(.white)
    }

    private var imagePlaceholder: some View {
        Image(systemName: Images.teamPLaceholder)
            .resizable()
            .scaledToFit()
    }

    private var imageView: some View {
        AsyncImage(url: item.imageURL) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            imagePlaceholder
                .opacity(0.1)
        }
    }

    private var nameView: some View {
        Text(item.name ?? Strings.Translations.unknown)
    }

    init(item: CardViewItem) {
        self.item = item
    }

    var body: some View {
        ZStack {
            backgroundView
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            VStack(spacing: Spacing.standard) {
                imageView
                    .clipShape(Circle())
                nameView
            }
            .padding(Spacing.standard)
        }
    }
}
