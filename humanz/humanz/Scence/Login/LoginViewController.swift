//
//  LoginViewController.swift
//  humanz
//
//  Created on 17/12/2023.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var mobileStackView: UIStackView!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var pickerTextField: PickerViewTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPickerTextField()
    }
    
    private func setupPickerTextField() {
        pickerTextField.items = ["+20", "+977"]
    }
    
    @IBAction func continuButtonAction(_ sender: UIButton) {
        MainFactory.createRootHomeScreen()
    }
}
