//  UIViewExtension+Helper.swift
//  humanz
//
//  Created on 17/12/2023.

import UIKit

extension UIView
{
    public static var identifier : String
    {
        return NSStringFromClass(Self.self).components(separatedBy: ".").last!
    }
    
    public static var nib: UINib
    {
        return .init(nibName: identifier, bundle: nil)
    }
}

// corner radius
extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        set(newVal) {
            layer.cornerRadius = newVal
        } get {
            return layer.cornerRadius
        }
    }
}
