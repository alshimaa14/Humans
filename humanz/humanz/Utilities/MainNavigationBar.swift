//
//  CustomNavigationController.swift
//  humanz
//
//  Created on 17/12/2023.
//

import UIKit

class MainNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.black,
        ]

        navigationBar.prefersLargeTitles = false
        navigationBar.largeTitleTextAttributes = [
            .foregroundColor: UIColor.black,
        ]

        /// for hidden bar color
        navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
        navigationBar.tintColor = .black
        navigationBar.barTintColor = .black
        navigationBar.layer.masksToBounds = false
       
        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithTransparentBackground()
            appearance.titleTextAttributes = [
                .foregroundColor: UIColor.black,
            ]

            appearance.largeTitleTextAttributes = [
                .foregroundColor: UIColor.black,
            ]
            navigationBar.standardAppearance = appearance
            navigationBar.scrollEdgeAppearance = navigationBar.standardAppearance
        }
    }
}
