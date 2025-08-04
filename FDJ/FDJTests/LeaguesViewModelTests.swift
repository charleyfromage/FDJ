import XCTest
import FDJ

class LeaguesViewModelTests : XCTestCase {
    func testLeaguesFiltering() {
        /// Given
        var leaguesViewModel = LeaguesViewModelImpl()

        /// When
        leaguesViewModel.leagues = [League(id: "", name: "Test1"),
                                    League(id: "", name: "Tost2"),
                                    League(id: "", name: "Test3"),
                                    League(id: "", name: "Tust4"),
                                    League(id: "", name: "Test5")]
        leaguesViewModel.searchText = "Te"

        /// Then
        XCTAssertTrue(leaguesViewModel.filteredLeagues.count == 3)
        XCTAssertTrue(leaguesViewModel.filteredLeagues.map { $0.name } == ["Test1", "Test3", "Test5"])
    }
}
