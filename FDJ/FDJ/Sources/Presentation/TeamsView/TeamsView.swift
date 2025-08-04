import SwiftUI

enum TeamsViewAction {
    case load
    case tapOnItem(Team)
}

struct TeamsView<State: TeamsViewState>: View {
    @StateObject var state: State

    private var cardsSize: CGFloat {
        (UIScreen.main.bounds.width - 3 * Spacing.standard) / 2
    }

    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible(), spacing: Spacing.standard), GridItem(.flexible(), spacing: Spacing.standard)],
                      spacing: Spacing.standard) {
                ForEach(state.viewModel.filteredTeams, id: \.id) { team in
                    CardView(item: team)
                        .frame(height: cardsSize)
                        .onTapGesture {
                            state.handle(action: .tapOnItem(team))
                        }
                }
            }
            .padding(.horizontal, Spacing.standard)
        }
        .background(Color(uiColor: .systemGray5))
        .onLoad {
            state.handle(action: .load)
        }
    }
}
