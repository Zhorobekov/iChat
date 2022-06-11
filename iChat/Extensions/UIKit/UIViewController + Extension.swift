//
//  UIViewController + Extension.swift
//  iChat
//
//  Created by Эрмек Жоробеков on 11.06.2022.
//

import UIKit

extension UIViewController  {
    
    func configure<T: SelfConfigureCell, U: Hashable>(collectionView: UICollectionView, cellType: T.Type, with value: U, for indexPath: IndexPath) -> T {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseId, for: indexPath) as? T else { fatalError("Unable  to dequeue \(cellType)")}
        cell.configure(with: value)
        return cell
    }
}
