//
//  HomeViewController.swift
//  humanz
//
//  Created on 17/12/2023.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var searchStackView: UIStackView!
    @IBOutlet weak var searchBackgroundView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var viewModel: HomeVMProtocol?
    
    func setViewModel(_ viewModel: HomeVMProtocol?) {
        self.viewModel = viewModel
    }
    
    private lazy var logoIcon: UIImageView = {
        let image = UIImageView(
            image: UIImage(named: "logo")?
                .withRenderingMode(.alwaysOriginal)
        )
        image.contentMode = .scaleAspectFit
        NSLayoutConstraint.activate([
            image.heightAnchor.constraint(equalToConstant: 40),
            image.widthAnchor.constraint(equalToConstant: 150)
        ])
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.titleView = logoIcon
        setupTextFieldUI()
        setupCollectionView()
        configureCompositionalLayout()
        viewModel?.setArrayMembers()
    }

}

extension HomeViewController {
    private func setupTextFieldUI() {
        searchStackView.layer.masksToBounds = true
        searchBackgroundView.layer.shadowOpacity = 0.6
        searchBackgroundView.layer.shadowRadius = 3.0
        searchBackgroundView.layer.shadowOffset = CGSize.zero
        searchBackgroundView.layer.shadowColor = UIColor.gray.cgColor
    }
    
    private func setupCollectionView() {
        collectionView.register(ProductCollectionViewCell.nib, forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
        
        let sectionHeader = UINib(
            nibName: SectionHeaderView.identifier,
            bundle: .main
        )
        
        collectionView.register(
            sectionHeader,
            forSupplementaryViewOfKind: Constants.collectionSectionHeader,
            withReuseIdentifier: Constants.collectionSectionHeader
        )
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    
    func configureCompositionalLayout() {
        let layout = UICollectionViewCompositionalLayout {sectionIndex, environment in
            switch sectionIndex {
            default:
                return HomeAppLayouts().productSection()
            }
        }
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        viewModel?.numberOfCategoriesRows ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.getCategoryProductsNumber(at: section) ?? 0

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        default:
            let cell = collectionView.dequeue(type: ProductCollectionViewCell.self, indexPath: indexPath)
            cell.productImage = viewModel?.getCategoryProductImage(at: indexPath)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let view = collectionView.dequeueReusableSupplementaryView(
            ofKind: Constants.collectionSectionHeader,
            withReuseIdentifier: Constants.collectionSectionHeader,
            for: indexPath) as? SectionHeaderView
        else { return UICollectionReusableView()}
        view.categoryName = viewModel?.getCategoryName(at: indexPath)
        return view
    }
    
}
