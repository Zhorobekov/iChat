//
//  Validators.swift
//  iChat
//
//  Created by Эрмек Жоробеков on 23.06.2022.
//

import Foundation

class Validators {
    
    static func isFilled(email: String?, password: String?, confirmPassword: String?) -> Bool {
        guard let email = email,
              let password = password,
              let confirmPassword = confirmPassword,
              email != "",
              password != "",
              confirmPassword != "" else {
                  return false
              }
        return true
    }
    
    static func isFilled(username: String?, description: String?, sex: String?) -> Bool {
        guard let username = username,
              let description = description,
              let sex = sex,
              username != "",
              description != "",
              sex != "" else { return false}
        return true
    }
    
    static func isSimpleEmail(_ email: String) -> Bool {
        let emailRegEx = "^.+@.+\\..{2,}$"
        return check(text: email, regEx: emailRegEx)
    }
    
    private static func check(text: String, regEx: String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", regEx)
        return predicate.evaluate(with: text)
    }
}
