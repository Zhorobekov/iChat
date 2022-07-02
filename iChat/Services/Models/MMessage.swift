//
//  MMessage.swift
//  iChat
//
//  Created by Эрмек Жоробеков on 02.07.2022.
//

import UIKit

struct MMessage: Hashable {
    let content: String
    let senderId: String
    let senderUserName: String
    let sentDate: Date
    let id: String?
    
    init(user: MUser, content: String) {
        self.content = content
        senderId = user.id
        senderUserName = user.username
        sentDate = Date()
        id = nil
    }
    
    var representation: [String : Any] {
        let representation: [String : Any] = [
            "created": sentDate,
            "senderId": senderId,
            "senderName": senderUserName,
            "content": content
        ]
        return representation
    }
}
