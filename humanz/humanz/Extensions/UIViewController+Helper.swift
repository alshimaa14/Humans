//  UIViewController+Helper.swift
//  humanz
//
//  Created on 17/12/2023.


import UIKit

// MARK: - InstanceViewController from storyBoard
public extension UIViewController {
    class func instance(_ storyboard: StoryBoardTypes = .main) -> Self {
        let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        return instate(storyboard, identifier: nameOfVC)
    }
    
    private static var nameOfVC: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
    
    fileprivate class func instate<T: UIViewController>(_ storyboard: UIStoryboard, identifier: String) -> T {
        return (storyboard.instantiateViewController(withIdentifier: identifier) as? T)!
    }
}



// MARK: - Navigation metthods and setup Main settings of it
public extension UIViewController {
    
    func hideBackButtonTitle() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    func push(_ viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func pop(_ viewController: UIViewController) {
        navigationController?.popToViewController(viewController, animated: true)
    }
}
