//
//  AppConfig.swift
//  Oddsium
//
//  Created by Samuel Kebis on 30/01/2023.
//

import ShortcutFoundation
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
    }

    private func injectViewModels(_ injector: Injector) {
        injector.map(CalendarViewModel.self) {
            return CalendarViewModel()
        }
    }
}
