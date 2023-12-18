//
//  OnboardingViewController.swift
//  humanz
//
//  Created on 17/12/2023.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var findProfessionalsLabel: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var goHereButton: UIButton!
    @IBOutlet weak var browseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabelsUI()
        SetupButtonsUI()
        navigationItem.backButtonTitle = ""
    }

    @IBAction func continueButtonTapped(_ sender: Any) {
        navigateToAuthentication()
    }
    
}

extension OnboardingViewController {
    
    private func setupLabelsUI() {
        findProfessionalsLabel.text = "Find local\nprofessionals for \nprety much \nanything."
    }
    
    private func SetupButtonsUI() {
        
        let underlinedButtonAttributes: [NSAttributedString.Key: Any] = [
              .font: UIFont.systemFont(ofSize: 15),
              .foregroundColor: UIColor(named: "AppColor") ?? .white,
              .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        
        let browseString = NSMutableAttributedString(
            string: "Browse Humenz as a guest",
            attributes: underlinedButtonAttributes
        )
        
        let goHereString = NSMutableAttributedString(
            string: "Go here",
            attributes: underlinedButtonAttributes
        )
        
        goHereButton.setAttributedTitle(goHereString, for: .normal)
        browseButton.setAttributedTitle(browseString, for: .normal)
    }
    
    func navigateToAuthentication() {
        push(OnboardingFactory.createLoginScreen())
    }

}

