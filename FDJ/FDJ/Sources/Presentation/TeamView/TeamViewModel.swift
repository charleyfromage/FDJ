protocol TeamViewModel {
    var team: Team { get }
}

struct TeamViewModelImpl: TeamViewModel {
    let team: Team
}
