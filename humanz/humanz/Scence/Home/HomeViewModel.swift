//
//  LoginViewModel.swift
//  humanz
//
//  Created on 18/12/2023.
//

import Foundation

protocol HomeVMProtocol {
    var numberOfCategoriesRows: Int { get }
    func getCategoryProductsNumber(at section: Int) -> Int
    func setArrayMembers()
    func getCategoryName(at indexPath: IndexPath) -> String
    func getCategoryProductImage(at indexPath: IndexPath) -> String
}

class HomeViewModel: HomeVMProtocol {
    
    private var categories: [CategoryModel]?
    var numberOfCategoriesRows: Int { categories?.count ?? 0}
    
    init() {
    }
    
    func setArrayMembers() {
        categories = [
            CategoryModel(
                categoryName: "Home Maintainance",
                catrgoryProductsPhotos: ["Winger", "makeup", "Winger", "makeup", "Winger", "makeup"]
            ),
            CategoryModel(
                categoryName: "Beauty and Wellness",
                catrgoryProductsPhotos: ["makeup", "Winger", "makeup", "Winger", "makeup", "Winger"]
            ),
            CategoryModel(
                categoryName: "Legal",
                catrgoryProductsPhotos: ["Winger", "makeup", "Winger", "makeup", "Winger", "makeup"]
            ),
            CategoryModel(categoryName: "Moving into a new home", catrgoryProductsPhotos: ["makeup", "Winger", "makeup", "Winger", "makeup", "Winger"])
            ]
    }
    
    func getCategoryProductsNumber(at section: Int) -> Int {
        return categories?[section].catrgoryProductsPhotos?.count ?? 0
    }
    
    func getCategoryName(at indexPath: IndexPath) -> String {
        return(categories?[indexPath.section].categoryName) ?? ""
    }
    
    func getCategoryProductImage(at indexPath: IndexPath) -> String {
        return(categories?[indexPath.section].catrgoryProductsPhotos?[indexPath.row]) ?? ""
    }
}
