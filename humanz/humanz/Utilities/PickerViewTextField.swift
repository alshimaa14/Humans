//  PickerViewTextField.swift
//  humanz
//
//  Created on 17/12/2023.

import UIKit

@IBDesignable
class PickerViewTextField: UITextField {
    
    var textHandler: (String) -> Void = { _ in }
    var didSelectItem: ((Any) -> Void)?
    var didSelectItemAtRow: ((Int) -> Void)?
    
    private lazy var pickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.dataSource = self
        pickerView.delegate = self
        return pickerView
    }()

    private var selectedRow = 0

    var items = [CustomStringConvertible]() {
        didSet {
            pickerView.reloadAllComponents()
            if isFirstResponder == true {
                pickerView(pickerView, didSelectRow: selectedRow, inComponent: 0)
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupPicker()
        delegate = self
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupPicker()
        delegate = self
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setupPicker()
        delegate = self
    }

    private func setupPicker() {
        inputView = pickerView
    }

    func reloadData() {
        pickerView.reloadAllComponents()
    }

    func setSelectedItem<T: CustomStringConvertible>(_ item: T) {
        guard let selectedItem = items.first(where: { ($0 as AnyObject).description == item.description }) else { return }
        selectedRow = items.firstIndex(where: { ($0 as AnyObject).description == (selectedItem as AnyObject).description }) ?? 0
        pickerView.selectRow(selectedRow, inComponent: 0, animated: false)
        pickerView(pickerView, didSelectRow: selectedRow, inComponent: 0)
    }

    override func canPerformAction(_: Selector, withSender _: Any?) -> Bool {
        return false
    }

    override func caretRect(for _: UITextPosition) -> CGRect {
        return .zero
    }

    override func selectionRects(for _: UITextRange) -> [UITextSelectionRect] {
        return []
    }
}

extension PickerViewTextField: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in _: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_: UIPickerView, numberOfRowsInComponent _: Int) -> Int {
        return items.count
    }
    
    func pickerView(_: UIPickerView, titleForRow row: Int, forComponent _: Int) -> String? {
        return items[row].description
    }
    
    func pickerView(_: UIPickerView, didSelectRow row: Int, inComponent _: Int) {
        guard items.count > 0 else { return }
        selectedRow = row
        endEditing(true)
        if !items.isEmpty {
            text = items[selectedRow].description
            didSelectItemAtRow?(selectedRow)
        }
    }
}

extension PickerViewTextField: UITextFieldDelegate {
        
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text as NSString? {
            let updatedText = text.replacingCharacters(in: range, with: string)
            textHandler(updatedText)
        }
        return true
    }
}
