//
//  SetupProfileViewController.swift
//  iChat
//
//  Created by Эрмек Жоробеков on 01.06.2022.
//

import UIKit

class SetupProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
}

//MARK: SwiftUI
import SwiftUI

struct SetupProfileViewControllerProvider: PreviewProvider {
    
    static var previews: some View {
        ContainerView()
            .edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let setupProfileViewController = SetupProfileViewController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return setupProfileViewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}
