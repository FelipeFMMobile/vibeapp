//
//  AvailabilityScreenView.swift
//  VibeApp
//
//  Created by Codex on 03/03/26.
//

import SwiftUI

struct AvailabilityScreenView: View {
    @StateObject private var viewModel = AvailabilityScreenViewModel()

    private let pageBackground = Color(red: 242 / 255, green: 242 / 255, blue: 247 / 255)
    private let primaryBlue = Color(red: 0 / 255, green: 87 / 255, blue: 255 / 255)
    private let selectedTab = Color(red: 87 / 255, green: 78 / 255, blue: 250 / 255)
    private let bodyText = Color(red: 60 / 255, green: 60 / 255, blue: 67 / 255)
    private let tabText = Color(red: 73 / 255, green: 85 / 255, blue: 109 / 255)
    private let border = Color(red: 218 / 255, green: 224 / 255, blue: 230 / 255)

    var body: some View {
        ZStack(alignment: .bottom) {
            pageBackground
                .ignoresSafeArea()

            content
        }
        .onAppear {
            viewModel.onAppear()
        }
        .sheet(isPresented: $viewModel.isDatePickerPresented) {
            NavigationStack {
                DatePicker(
                    AvailabilityScreenViewModel.Strings.datePickerTitle,
                    selection: selectedDateBinding,
                    displayedComponents: .date
                )
                .datePickerStyle(.graphical)
                .padding()
                .navigationTitle(AvailabilityScreenViewModel.Strings.datePickerTitle)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(AvailabilityScreenViewModel.Strings.doneButton) {
                            viewModel.didTapDatePickerDone()
                        }
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var content: some View {
        switch viewModel.viewState {
        case .idle, .success:
            mainContent
        case .loading:
            ProgressView()
        case .error:
            Text(AvailabilityScreenViewModel.Strings.errorMessage)
                .font(.system(size: 15, weight: .regular))
                .foregroundStyle(.black)
        }
    }

    private var mainContent: some View {
        VStack(alignment: .leading, spacing: 0) {
            topNavigation

            VStack(alignment: .leading, spacing: 16) {
                header
                tabsAndDate
            }
            .padding(.top, 8)
            .padding(.horizontal, 16)

            Spacer()

            bottomBar
        }
    }

    private var topNavigation: some View {
        VStack(alignment: .leading, spacing: 0) {
            Color.clear.frame(height: 47)

            Button(action: viewModel.didTapTopBack) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(.black)
                    .frame(width: 40, height: 40)
                    .background(pageBackground)
                    .clipShape(Circle())
            }
            .buttonStyle(.plain)
            .padding(.horizontal, 16)
        }
        .frame(height: 95)
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(AvailabilityScreenViewModel.Strings.title)
                .font(.system(size: 28, weight: .bold))
                .tracking(0.36)
                .foregroundStyle(.black)

            Text(AvailabilityScreenViewModel.Strings.subtitle)
                .font(.system(size: 15, weight: .regular))
                .tracking(-0.24)
                .foregroundStyle(.black)
                .fixedSize(horizontal: false, vertical: true)
        }
    }

    private var tabsAndDate: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 0) {
                tabButton(title: AvailabilityScreenViewModel.Strings.hourTab, tab: .hour)
                tabButton(title: AvailabilityScreenViewModel.Strings.dayTab, tab: .day)
            }

            VStack(alignment: .leading, spacing: 12) {
                Text(AvailabilityScreenViewModel.Strings.dateLabel)
                    .font(.system(size: 13, weight: .bold))
                    .tracking(-0.08)
                    .foregroundStyle(bodyText.opacity(0.6))

                Button(action: viewModel.didTapDateField) {
                    HStack(spacing: 16) {
                        Text(viewModel.dateRange)
                            .font(.system(size: 16, weight: .medium))
                            .tracking(-0.1)
                            .foregroundStyle(Color(red: 39 / 255, green: 45 / 255, blue: 55 / 255))

                        Spacer(minLength: 0)

                        Image(systemName: "calendar")
                            .font(.system(size: 22, weight: .regular))
                            .foregroundStyle(Color(red: 57 / 255, green: 57 / 255, blue: 74 / 255))
                    }
                    .padding(.horizontal, 20)
                    .frame(height: 48)
                    .overlay(
                        RoundedRectangle(cornerRadius: 24)
                            .stroke(border, lineWidth: 1)
                    )
                }
                .buttonStyle(.plain)
            }
        }
    }

    private var bottomBar: some View {
        HStack {
            actionButton(
                AvailabilityScreenViewModel.Strings.backButton,
                background: pageBackground,
                foreground: .black,
                action: viewModel.didTapBottomBack
            )

            Spacer()

            actionButton(
                AvailabilityScreenViewModel.Strings.nextButton,
                background: primaryBlue,
                foreground: .white,
                action: viewModel.didTapNext
            )
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 16)
        .background(Color.white)
    }

    private func tabButton(title: String, tab: AvailabilityScreenViewModel.AvailabilityTab) -> some View {
        Button(action: { viewModel.didSelectTab(tab) }) {
            Text(title)
                .font(.system(size: 15, weight: .semibold))
                .foregroundStyle(viewModel.selectedTab == tab ? .white : tabText)
                .padding(.horizontal, 16)
                .padding(.vertical, 9)
                .background(viewModel.selectedTab == tab ? selectedTab : Color.clear)
                .clipShape(Capsule())
        }
        .buttonStyle(.plain)
    }

    private func actionButton(_ title: String, background: Color, foreground: Color, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 17, weight: .semibold))
                .tracking(-0.4)
                .foregroundStyle(foreground)
                .frame(height: 50)
                .padding(.horizontal, 32)
                .background(background)
                .clipShape(Capsule())
        }
        .buttonStyle(.plain)
    }

    private var selectedDateBinding: Binding<Date> {
        Binding(
            get: { viewModel.selectedDate },
            set: { newDate in
                viewModel.didSelectDate(newDate)
            }
        )
    }
}
