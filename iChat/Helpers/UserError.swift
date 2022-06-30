//
//  UserError.swift
//  iChat
//
//  Created by Эрмек Жоробеков on 26.06.2022.
//

import Foundation

enum UserError {
    case notFilled
    case photoNotExist
    case cannotUnwrapToMUser
    case cannotGetUserInfo
}

extension UserError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .notFilled:
            return NSLocalizedString("Заполните все поля", comment: "")
        case .photoNotExist:
            return NSLocalizedString("Пользователь не выбрал фотографию", comment: "")
        case .cannotUnwrapToMUser:
            return NSLocalizedString("Невозиожно конвертировать MUser из User", comment: "")
        case .cannotGetUserInfo:
            return NSLocalizedString("Невозможно загрузить информацию о User из Firebase", comment: "")
        }
    }
}
