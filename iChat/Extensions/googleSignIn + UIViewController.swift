//
//  googleSignIn + UIViewController.swift
//  iChat
//
//  Created by Эрмек Жоробеков on 02.07.2022.
//

import UIKit
import FirebaseAuth

extension UIViewController {
    
    func googleSignIn(user: User) {
        FirestoreService.shared.getUserData(user: user) { result in
            switch result {
            case .success(let muser):
                let mainTabBar = MainTabBarController(currentUser: muser)
                mainTabBar.modalPresentationStyle = .fullScreen
                self.showAlert(with: "Успешно", and: "Вы авторизованы") {
                    self.present(mainTabBar, animated: true, completion: nil)
                }
            case .failure(_):
                self.showAlert(with: "Успешно", and: "Вы зарегистрированы") {
                    self.present(SetupProfileViewController(currentUser: user), animated: true, completion: nil)
                }
            }
        }
    }
}
