import SwiftUI

enum LeaguesViewAction {
    case load
    case tapOnItem(League)
}

struct LeaguesView<State: LeaguesViewState>: View {
    @StateObject var state: State
    
    var body: some View {
        NavigationView {
            List {
                ForEach(state.viewModel.filteredLeagues, id: \.id) { league in
                    Text(league.name ?? Strings.Translations.unknown)
                        .onTapGesture {
                            state.handle(action: .tapOnItem(league))
                        }
                }
            }
        }
        .searchable(text: $state.viewModel.searchText)
        .onLoad {
            state.handle(action: .load)
        }
    }
}
