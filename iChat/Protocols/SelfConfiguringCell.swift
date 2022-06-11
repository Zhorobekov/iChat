//
//  SelfConfiguringCell.swift
//  iChat
//
//  Created by Эрмек Жоробеков on 09.06.2022.
//

import Foundation

protocol SelfConfigureCell {
    static var reuseId: String { get }
    func configure<U: Hashable>(with value: U)
}
