//
//  ViewController.swift
//  iChat
//
//  Created by Эрмек Жоробеков on 29.05.2022.
//

import UIKit

class AuthViewController: UIViewController {

    let logoImageView = UIImageView(image: #imageLiteral(resourceName: "Logo"), contentMode: .scaleAspectFit)
    
    let googleLabel = UILabel(text: "Get started with")
    let email = UILabel(text: "Or sign up with")
    let alreadyOnboard = UILabel(text: "Already on board?")
    
    
    let emailButton = UIButton(title: "Email",
                               titleColor: .white,
                               backgroundColor: .buttonDark())
    
    let loginButton = UIButton(title: "Login",
                               titleColor: .buttonRed(),
                               isShadow: true,
                               backgroundColor: .white)
    
    let googleButton = UIButton(title: "Google",
                                titleColor: .black,
                                isShadow: true,
                                backgroundColor: .white)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }


}

//MARK: SwiftUI
import SwiftUI

struct AuthViewControllerProvider: PreviewProvider {
    
    
    static var previews: some View {
        ContainerView()
            .edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = AuthViewController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
        
    }
    
    
    
    
}


