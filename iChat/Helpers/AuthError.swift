//
//  AuthError.swift
//  iChat
//
//  Created by Эрмек Жоробеков on 23.06.2022.
//

import Foundation

enum AuthError {
    case notFiled
    case invalidEmail
    case passwordsNotMatcher
    case unknownError
    case serverError
}

extension AuthError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .notFiled:
            return NSLocalizedString("Заполните все поля", comment: "")
        case .invalidEmail:
            return NSLocalizedString("Неверный формат почты", comment: "")
        case .passwordsNotMatcher:
            return NSLocalizedString("Пароли не совпадают", comment: "")
        case .unknownError:
            return NSLocalizedString("Неизвестная ошибка", comment: "")
        case .serverError:
            return NSLocalizedString("Ошибка сервера", comment: "")
        }
    }
}
