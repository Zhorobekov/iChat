//
//  SignUpViewController.swift
//  iChat
//
//  Created by Эрмек Жоробеков on 30.05.2022.
//

import UIKit

class  SignUpViewController: UIViewController {
    
    private let welcomeLabel = UILabel(text: "Good to see you", font: .avenir26())
    
    private let emailLabel = UILabel(text: "Email")
    private let passwordLabel = UILabel(text: "Password")
    private let confirmLabel = UILabel(text: "Confirm password")
    private let alreadyOnBoardLabel = UILabel(text: "Already on board?")
    
    private let emailTextField = OneLineTextField(font: .avenir20())
    private let passwordTextField = OneLineTextField(font: .avenir20())
    private let confirmPasswordTextField = OneLineTextField(font: .avenir20())
    
    private let signUpButton = UIButton(title: "Sign up", titleColor: .white, backgroundColor: .buttonDark(), cornerRadius: 4)
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = .avenir20()
        button.setTitleColor(.buttonRed(), for: .normal)
        button.contentHorizontalAlignment = .leading
        return button
    }()
    
    weak var delegate: AuthNavigatingDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupConstraints()
        
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    @objc private func loginButtonTapped() {
        dismiss(animated: true) {
            self.delegate?.toLoginViewController()
        }
    }
    
    @objc private func signUpButtonTapped() {
        AuthService.shared.register(email: emailTextField.text,
                                    password: passwordTextField.text,
                                    confirmPassword: confirmPasswordTextField.text) { result in
            switch result {
                
            case .success(let user):
                self.showAlert(with: "Успешно", and: "Вы зарегистрированы") {
                    self.present(SetupProfileViewController(currentUser: user), animated: true, completion: nil)
                }
                
            case .failure(let error):
                self.showAlert(with: "Ошибка", and: error.localizedDescription)
            }
        }
    }
    
}

extension UIViewController {
    func showAlert(with title: String, and message: String, completion: @escaping () -> Void = { } ) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            completion()
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}

//MARK: - Setup Constraints
extension SignUpViewController {
    
    private func setupConstraints() {
        let emailStackView = UIStackView(arrangedSubviews: [emailLabel, emailTextField], axis: .vertical, spacing: 0)
        let passwordStackView = UIStackView(arrangedSubviews: [passwordLabel, passwordTextField], axis: .vertical, spacing: 0)
        let confirmPasswordStackView = UIStackView(arrangedSubviews: [confirmLabel, confirmPasswordTextField], axis: .vertical, spacing: 0)
        
        signUpButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        let stackView = UIStackView(arrangedSubviews: [
            emailStackView,
            passwordStackView,
            confirmPasswordStackView,
            signUpButton
        ],
                                    axis: .vertical,
                                    spacing: 40)
        
        let bottomStackView = UIStackView(arrangedSubviews: [
            alreadyOnBoardLabel,
            loginButton
        ],
                                          axis: .horizontal,
                                          spacing: 0)
        bottomStackView.alignment = .firstBaseline
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(welcomeLabel)
        view.addSubview(stackView)
        view.addSubview(bottomStackView)
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 30),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
        
        NSLayoutConstraint.activate([
            bottomStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -35),
            bottomStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            bottomStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
       
    }
}

//MARK: SwiftUI
import SwiftUI

struct SignUPViewControllerProvider: PreviewProvider {
    
    static var previews: some View {
        ContainerView()
            .edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let signUpViewController = SignUpViewController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return signUpViewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}

