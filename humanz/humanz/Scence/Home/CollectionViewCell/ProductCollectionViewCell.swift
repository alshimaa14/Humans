//
//  CollectionViewCell.swift
//  humanz
//
//  Created on 17/12/2023.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    var productImage: String? {
        didSet {
            guard let image = productImage else { return }
            imageView.image = UIImage(named: image)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
