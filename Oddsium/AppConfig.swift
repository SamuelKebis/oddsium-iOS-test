//
//  AppConfig.swift
//  Oddsium
//
//  Created by Samuel Kebis on 30/01/2023.
//

import DataLoader
import ShortcutFoundation
import Navigation
import Network

struct AppConfig: Config {
    func configure(_ injector: Injector) {
        injectServices(injector)
        injectViewModels(injector)
    }

    private func injectServices(_ injector: Injector) {
        injector.map(ApiService.self) {
            return DefaultApiService()
        }

        injector.map(DataProvider.self) {
            return DataProvider()
        }

        injector.map(AppNavigator.self) {
            AppNavigator(root: .calendar, viewer: AppDestinationViewer())
        }
    }

    private func injectViewModels(_ injector: Injector) {
        injector.map(CalendarViewModel.self) {
            return CalendarViewModel()
        }
    }
}
