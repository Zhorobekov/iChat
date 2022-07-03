//
//  WaitingChatsNavigation.swift
//  iChat
//
//  Created by Эрмек Жоробеков on 03.07.2022.
//

import Foundation

protocol WaitingChatsNavigation: AnyObject {
    func removeWaitingChat(chat: MChat)
    func chatToActive(chat: MChat)
}
