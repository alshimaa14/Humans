//
//  OnboardingFactory.swift
//  humanz
//
//  Created on 17/12/2023.
//

import UIKit

struct OnboardingFactory {
    static func createOnboardingScreen() -> OnboardingViewController {
        let viewController = OnboardingViewController.instance(.onboarding)
        return viewController
    }
    
    static func createLoginScreen() -> LoginViewController {
        let viewController = LoginViewController.instance(.onboarding)
        viewController.title = "Enter Mobile Number"
        return viewController
    }
}
