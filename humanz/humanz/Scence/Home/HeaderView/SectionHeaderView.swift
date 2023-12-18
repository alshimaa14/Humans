//
//  SectionHeaderView.swift
//  humanz
//
//  Created  on 17/12/2023.
//

import UIKit
import Combine

class SectionHeaderView: UICollectionReusableView {
    
    @IBOutlet weak var headetTitleLabel: UILabel!
    
    var categoryName: String? {
        didSet {
            guard let name = categoryName else { return }
            headetTitleLabel.text = name
        }
    }
    
    override func awakeFromNib() { }
}
