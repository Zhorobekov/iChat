//
//  PeopleViewController.swift
//  iChat
//
//  Created by Эрмек Жоробеков on 03.06.2022.
//

import UIKit

class PeopleViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupSearchBar()
    }
    
    private func setupSearchBar() {
        navigationController?.navigationBar.barTintColor = .mainWhite()
        navigationController?.navigationBar.shadowImage = UIImage()
        
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
}

//MARK: - SearchBarController
extension PeopleViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}


//MARK: SwiftUI
import SwiftUI

struct PeopleViewControllerProvider: PreviewProvider {
    
    static var previews: some View {
        ContainerView()
            .edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let mainTabBarViewController = MainTabBarController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return mainTabBarViewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}


