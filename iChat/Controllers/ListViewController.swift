//
//  ListViewController.swift
//  iChat
//
//  Created by Эрмек Жоробеков on 03.06.2022.
//

import UIKit

class ListViewController: UIViewController {
    
    var collectionView: UICollectionView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupSearchBar()
        setupCollectionView()
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
    
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .mainWhite()
        view.addSubview(collectionView)
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellid")
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
}

//MARK: - SearchBarController
extension ListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension ListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
}


//MARK: SwiftUI
import SwiftUI

struct ListViewControllerProvider: PreviewProvider {
    
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

