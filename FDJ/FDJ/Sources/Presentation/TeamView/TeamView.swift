import SwiftUI

struct TeamView<State: TeamViewState>: View {
    @StateObject var state: State

    private var imagePlaceholder: some View {
        Image(systemName: Images.teamPLaceholder)
            .resizable()
            .scaledToFit()
    }

    private var imageView: some View {
        AsyncImage(url: state.viewModel.team.imageURL) { result in
            result.image?
                .resizable()
                .scaledToFill()
        }
    }

    private var imagesStackView: some View {
        ZStack {
            imagePlaceholder
            imageView
        }
        .clipped()
    }

    var body: some View {
        ZStack {
            imagesStackView
                .opacity(0.05)
            ScrollView {
                Text(state.viewModel.team.description ?? Strings.Translations.unknown)
                    .padding(Spacing.standard)
            }
        }
        .background(Color(uiColor: .systemGray5))

    }
}
