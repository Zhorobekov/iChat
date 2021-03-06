//
//  AppDelegate.swift
//  iChat
//
//  Created by Эрмек Жоробеков on 29.05.2022.
//

import UIKit
import Firebase
import FirebaseAuth
import GoogleSignIn
import FirebaseStorage

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        
        let window = UIWindow()
        window.rootViewController = AuthViewController()
       
        if let user = Auth.auth().currentUser {
            FirestoreService.shared.getUserData(user: user) { result in
                switch result {
                case .success(let muser):
                    let mainTabBar = MainTabBarController(currentUser: muser)
                    mainTabBar.modalPresentationStyle = .fullScreen
                    window.rootViewController = mainTabBar
                case .failure(_):
                    window.rootViewController = AuthViewController()
                }
            }
        } else {
            window.rootViewController = AuthViewController()
        }
        
        window.makeKeyAndVisible()
        
        self.window = window
        
        return true
    }
    
    @available(iOS 9.0, *)
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance.handle(url)
    }
}



