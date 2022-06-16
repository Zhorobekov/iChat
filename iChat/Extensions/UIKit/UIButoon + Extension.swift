//
//  UIButoon + Extension.swift
//  iChat
//
//  Created by Эрмек Жоробеков on 29.05.2022.
//

import UIKit

extension UIButton {
    
    convenience init(title: String,
                     titleColor: UIColor,
                     isShadow: Bool = false,
                     font: UIFont? = .avenir20(),
                     backgroundColor: UIColor,
                     cornerRadius: CGFloat = 4) {
        self.init(type: .system)
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        self.titleLabel?.font = font
        self.layer.cornerRadius = cornerRadius
        
        if isShadow {
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowRadius = 4
            self.layer.shadowOpacity = 2
            self.layer.shadowOffset = CGSize(width: 0, height: 4)
        }
    }
    
    func customizeGoogleButton() {
        let googleLogo = UIImageView(image: #imageLiteral(resourceName: "googleLogo"), contentMode: .scaleAspectFit)
        googleLogo.translatesAutoresizingMaskIntoConstraints = false
       
        self.addSubview(googleLogo)
        
        googleLogo.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24).isActive = true
        googleLogo.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}
