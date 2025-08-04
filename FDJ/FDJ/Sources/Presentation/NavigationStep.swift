enum NavigationStep: Hashable, Equatable {
    case leagues
    case teams(League)
    case team(Team)
}
