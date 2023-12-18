//
//  AppDelegate.swift
//  humanz
//
//  Created on 17/12/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    static var shared: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupWindow()
        startApp()
        return true
    }
    
    func setRootViewController(_ viewController: UIViewController, animated: Bool = false) {
        
        guard animated else {
            window?.rootViewController = viewController
            return
        }
        let transition = UIView.AnimationOptions.transitionCrossDissolve
        window?.rootViewController = viewController
        UIView.transition(with: window!, duration: 0.5, options: transition, animations: {})
    }
    
    func startApp() {
        let rootViewController = MainNavigationController(
            rootViewController: OnboardingFactory.createOnboardingScreen()
        )
        setRootViewController(rootViewController, animated: false)
    }

    func setupWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
    }

}

