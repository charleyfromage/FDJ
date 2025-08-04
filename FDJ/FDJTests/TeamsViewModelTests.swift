import XCTest
import FDJ

class TeamsViewModelTests : XCTestCase {
    func testTeamsFiltering() {
        /// Given
        var teamsViewModel = TeamsViewModelImpl()

        /// When
        teamsViewModel.teams = [Team(id: "", name: "Test1"),
                                Team(id: "", name: "Test2"),
                                Team(id: "", name: "Test3"),
                                Team(id: "", name: "Test4"),
                                Team(id: "", name: "Test5")]

        /// Then
        XCTAssertTrue(teamsViewModel.filteredTeams.count == 3)
        XCTAssertTrue(teamsViewModel.filteredTeams.map { $0.name }[0] == "Test5")
        XCTAssertTrue(teamsViewModel.filteredTeams.map { $0.name }[1] == "Test3")
        XCTAssertTrue(teamsViewModel.filteredTeams.map { $0.name }[2] == "Test1")
    }
}
