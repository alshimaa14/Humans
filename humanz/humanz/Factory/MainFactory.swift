//
//  Factory.swift
//  humanz
//
//  Created on 17/12/2023.
//

import UIKit

struct MainFactory {
    static func createRootHomeScreen() {
        let vc = MainNavigationController(rootViewController: createHomeScreen())
        AppDelegate.shared.setRootViewController(vc)
    }
    private static func createHomeScreen() -> HomeViewController {
        let viewController = HomeViewController.instance()
        let viewModel = HomeViewModel()
        viewController.setViewModel(viewModel)
        return viewController
    }
}

