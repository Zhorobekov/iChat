//
//  MMessage.swift
//  iChat
//
//  Created by Эрмек Жоробеков on 02.07.2022.
//

import UIKit
import FirebaseFirestore

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
    
    init?(document: QueryDocumentSnapshot) {
        let data = document.data()
        guard let sentDate = data["created"] as? Timestamp else { return nil }
        guard let senderId = data["senderId"] as? String else { return nil }
        guard let senderUserName = data["senderUserName"] as? String else { return nil }
        guard let content = data["content"] as? String else { return nil }
        
        self.id = document.documentID
        self.sentDate = sentDate.dateValue()
        self.senderId = senderId
        self.senderUserName = senderUserName
        self.content = content
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
