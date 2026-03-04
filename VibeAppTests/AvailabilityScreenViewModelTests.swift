import XCTest
@testable import VibeApp

final class AvailabilityScreenViewModelTests: XCTestCase {
    func testOnAppear_WhenIdle_SetsSuccessAndDefaultDate() {
        let viewModel = AvailabilityScreenViewModel()

        XCTAssertEqual(viewModel.viewState, .idle)
        XCTAssertEqual(viewModel.selectedTab, .day)

        viewModel.onAppear()

        XCTAssertEqual(viewModel.viewState, .success)
        XCTAssertEqual(viewModel.dateRange, AvailabilityScreenViewModel.Strings.defaultDateText)

        let expectedDate = Calendar.current.date(from: DateComponents(year: 2023, month: 6, day: 13))
        XCTAssertEqual(viewModel.selectedDate, expectedDate)
    }

    func testOnAppear_WhenNotIdle_DoesNotChangeState() {
        let viewModel = AvailabilityScreenViewModel()
        viewModel.viewState = .loading
        let previousDate = viewModel.selectedDate

        viewModel.onAppear()

        XCTAssertEqual(viewModel.viewState, .loading)
        XCTAssertEqual(viewModel.selectedDate, previousDate)
    }

    func testDidSelectTab_UpdatesSelectedTab() {
        let viewModel = AvailabilityScreenViewModel()

        viewModel.didSelectTab(.hour)

        XCTAssertEqual(viewModel.selectedTab, .hour)
    }

    func testDidTapDateField_PresentsDatePicker() {
        let viewModel = AvailabilityScreenViewModel()

        viewModel.didTapDateField()

        XCTAssertTrue(viewModel.isDatePickerPresented)
    }

    func testDidSelectDate_UpdatesSelectedDateAndDateRange() {
        let viewModel = AvailabilityScreenViewModel()
        let date = Calendar.current.date(from: DateComponents(year: 2026, month: 3, day: 4)) ?? Date()

        viewModel.didSelectDate(date)

        XCTAssertEqual(viewModel.selectedDate, date)

        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        XCTAssertEqual(viewModel.dateRange, formatter.string(from: date))
    }

    func testDidTapDatePickerDone_HidesDatePicker() {
        let viewModel = AvailabilityScreenViewModel()
        viewModel.isDatePickerPresented = true

        viewModel.didTapDatePickerDone()

        XCTAssertFalse(viewModel.isDatePickerPresented)
    }

    func testDidTapTopBack_DoesNotMutateState() {
        let viewModel = AvailabilityScreenViewModel()
        let snapshot = snapshotTest(for: viewModel)

        viewModel.didTapTopBack()

        XCTAssertEqual(snapshotTest(for: viewModel), snapshot)
    }

    func testDidTapBottomBack_DoesNotMutateState() {
        let viewModel = AvailabilityScreenViewModel()
        let snapshot = snapshotTest(for: viewModel)

        viewModel.didTapBottomBack()

        XCTAssertEqual(snapshotTest(for: viewModel), snapshot)
    }

    func testDidTapNext_DoesNotMutateState() {
        let viewModel = AvailabilityScreenViewModel()
        let snapshot = snapshotTest(for: viewModel)

        viewModel.didTapNext()

        XCTAssertEqual(snapshotTest(for: viewModel), snapshot)
    }

    private func snapshotTest(for viewModel: AvailabilityScreenViewModel) -> Snapshot {
        Snapshot(
            viewState: viewModel.viewState,
            selectedTab: viewModel.selectedTab,
            selectedDate: viewModel.selectedDate,
            dateRange: viewModel.dateRange,
            isDatePickerPresented: viewModel.isDatePickerPresented
        )
    }
    
    struct Snapshot: Equatable {
        let viewState: AvailabilityScreenViewModel.ViewState
        let selectedTab: AvailabilityScreenViewModel.AvailabilityTab
        let selectedDate: Date
        let dateRange: String
        let isDatePickerPresented: Bool
    }

}
