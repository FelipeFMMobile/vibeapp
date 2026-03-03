//
//  AvailabilityScreenViewModel.swift
//  VibeApp
//
//  Created by Codex on 03/03/26.
//

import Combine
import Foundation

final class AvailabilityScreenViewModel: ObservableObject {
    enum ViewState: Equatable {
        case idle
        case loading
        case success
        case error
    }

    enum AvailabilityTab: Equatable {
        case hour
        case day
    }

    @Published var viewState: ViewState = .idle
    @Published var selectedTab: AvailabilityTab = .day
    @Published var selectedDate: Date = Date()
    @Published var dateRange = Strings.defaultDateText
    @Published var isDatePickerPresented = false

    func onAppear() {
        guard viewState == .idle else { return }
        viewState = .success
        selectedDate = defaultSelectedDate
    }

    func didSelectTab(_ tab: AvailabilityTab) {
        selectedTab = tab
    }

    func didTapDateField() {
        isDatePickerPresented = true
    }

    func didSelectDate(_ date: Date) {
        selectedDate = date
        dateRange = Self.dateFormatter.string(from: date)
    }

    func didTapDatePickerDone() {
        isDatePickerPresented = false
    }

    func didTapTopBack() {
        // Navigation action should be injected/coordinated when flow is available.
    }

    func didTapBottomBack() {
        // Navigation action should be injected/coordinated when flow is available.
    }

    func didTapNext() {
        // Navigation action should be injected/coordinated when flow is available.
    }

    private let defaultSelectedDate: Date = {
        var components = DateComponents()
        components.year = 2023
        components.month = 6
        components.day = 13
        return Calendar.current.date(from: components) ?? Date()
    }()

    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter
    }()
}

extension AvailabilityScreenViewModel {
    enum Strings {
        static let title = "Give your availability"
        static let subtitle = "In this step, we'll ask you which type of stays you have and if guests will book the entire place or just a room."
        static let hourTab = "Hour"
        static let dayTab = "Day"
        static let dateLabel = "Date"
        static let defaultDateText = "06/13/2023"
        static let datePickerTitle = "Select date"
        static let backButton = "Back"
        static let nextButton = "Next"
        static let doneButton = "Done"
        static let errorMessage = "Something went wrong. Please try again."
    }
}
