//
//  MainTabBarController.swift
//  iChat
//
//  Created by Эрмек Жоробеков on 03.06.2022.
//

import UIKit

class MainTabBarController: UITabBarController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = #colorLiteral(red: 0.5893780589, green: 0.4638106823, blue: 0.9761075377, alpha: 1)
        
        let listViewController = ListViewController()
        let peopleViewController = PeopleViewController()
        
        let boldConfig = UIImage.SymbolConfiguration(weight: .medium)
        
        let peopleImage = UIImage(systemName: "person.2", withConfiguration: boldConfig)!
        let conversationImage = UIImage(systemName: "bubble.left.and.bubble.right", withConfiguration: boldConfig)!
        
        viewControllers = [
            generateNavigationController(rootViewController: peopleViewController, title: "People", image: peopleImage),
            generateNavigationController(rootViewController: listViewController, title: "Conversations", image: conversationImage)
            
        ]
    }
    
    private func generateNavigationController(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navigationViewController = UINavigationController(rootViewController: rootViewController)
        navigationViewController.tabBarItem.title = title
        navigationViewController.tabBarItem.image = image
        return navigationViewController
    }
}
