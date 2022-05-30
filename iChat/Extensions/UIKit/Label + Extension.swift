//
//  Label + Extension.swift
//  iChat
//
//  Created by Эрмек Жоробеков on 29.05.2022.
//

import UIKit

extension UILabel {
    
    convenience init(text: String,  font: UIFont? = .avenir20()) {
        self.init()
        
        self.text = text
        self.font = font
    }
}
