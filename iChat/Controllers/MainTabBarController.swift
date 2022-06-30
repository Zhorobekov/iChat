//
//  MainTabBarController.swift
//  iChat
//
//  Created by Эрмек Жоробеков on 03.06.2022.
//

import UIKit

class MainTabBarController: UITabBarController {
   
    private let currentUser: MUser
    
    init(currentUser: MUser = MUser(id: "123",
                                    email: "123",
                                    username: "123",
                                    avatarStringURL: "123",
                                    description: "123",
                                    sex: "123")) {
        self.currentUser = currentUser
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = #colorLiteral(red: 0.5893780589, green: 0.4638106823, blue: 0.9761075377, alpha: 1)
        
        let listViewController = ListViewController(currentUser: currentUser)
        let peopleViewController = PeopleViewController(currentUser: currentUser)
        
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
