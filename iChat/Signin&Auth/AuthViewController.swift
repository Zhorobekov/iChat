//
//  ViewController.swift
//  iChat
//
//  Created by Эрмек Жоробеков on 29.05.2022.
//

import UIKit

class AuthViewController: UIViewController {

    private let logoImageView = UIImageView(image: #imageLiteral(resourceName: "Logo"), contentMode: .scaleAspectFit)
    
    private let googleLabel = UILabel(text: "Get started with")
    private let emailLabel = UILabel(text: "Or sign up with")
    private let alreadyOnboardLabel = UILabel(text: "Already on board?")
    
    
    private let emailButton = UIButton(title: "Email",
                               titleColor: .white,
                               backgroundColor: .buttonDark())
    
    private let loginButton = UIButton(title: "Login",
                               titleColor: .buttonRed(),
                               isShadow: true,
                               backgroundColor: .white)
    
    private let googleButton = UIButton(title: "Google",
                                titleColor: .black,
                                isShadow: true,
                                backgroundColor: .white)
    
    private let signUpViewController = SignUpViewController()
    private let loginViewController = LoginViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupConstrains()
        
        googleButton.customizeGoogleButton()
        
        emailButton.addTarget(self, action: #selector(emailButtonTapped), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        signUpViewController.delegate = self
        loginViewController.delegate = self 
    }
    
    @objc private func emailButtonTapped() {
        print(#function)
        present(signUpViewController, animated: true, completion: nil)
    }
    
    @objc private func loginButtonTapped() {
        print(#function)
        present(loginViewController, animated: true, completion: nil)
    }
}

//MARK: - AuthNavigatingDelegate
extension AuthViewController: AuthNavigatingDelegate {
    func toLoginViewController() {
        present(loginViewController, animated: true, completion: nil)
    }
    
    func toSignUpViewController() {
        present(signUpViewController, animated: true, completion: nil)
    }
}

//MARK: - Setup Constraints
extension AuthViewController {
    private func setupConstrains() {
        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let googleView = ButtonFromView(label: googleLabel, button: googleButton)
        let emailView = ButtonFromView(label: emailLabel, button: emailButton)
        let loginView = ButtonFromView(label: alreadyOnboardLabel, button: loginButton)
        
        let stackView = UIStackView(arrangedSubviews: [googleView, emailView, loginView], axis: .vertical, spacing: 40)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(logoImageView)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 30),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
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
        
        let authViewController = AuthViewController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return authViewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {

        }
    }
}


