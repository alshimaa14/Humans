//
//  CollectionView+Helper.swift
//  humanz
//
//  Created on 17/12/2023.
//

import UIKit

extension UICollectionView {
    func dequeue<T: UICollectionViewCell>(type: T.Type, indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as! T
    }
}

public extension UICollectionView {
    /// Register a nib or class for each cell.
    ///
    /// - Note: This is required in favor of `registerReusableCell` since we need to explicitly set the
    ///         `bundle` with `.module` value.
    ///
    func register(_ cellClass: AnyClass,
                  identifier: String? = nil,
                  bundle: Bundle? = nil) {
        let nibName = String(describing: cellClass.self)
        let identifier = identifier ?? nibName
        let bundle = bundle ?? Bundle(for: cellClass)
        let nib = UINib(nibName: nibName, bundle: bundle)
        register(nib, forCellWithReuseIdentifier: identifier)
    }
}
