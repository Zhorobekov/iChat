//
//  MMessage.swift
//  iChat
//
//  Created by Эрмек Жоробеков on 02.07.2022.
//

import UIKit
import FirebaseFirestore
import MessageKit

struct MMessage: Hashable, MessageType {
   
    let id: String?
    var sender: SenderType
    let sentDate: Date
    let content: String

    var kind: MessageKind {
        return .text(content)
    }
    
    var messageId: String {
        return id ?? UUID().uuidString
    }
    
    init(user: MUser, content: String) {
        self.content = content
        sender = Sender(senderId: user.id, displayName: user.username)
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
        sender = Sender(senderId: senderId, displayName: senderUserName)
        self.content = content
    }
    
    var representation: [String : Any] {
        let representation: [String : Any] = [
            "created": sentDate,
            "senderId": sender.senderId,
            "senderName": sender.displayName,
            "content": content
        ]
        return representation
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(messageId)
    }
    
    static func == (lhs: MMessage, rhs: MMessage) -> Bool {
        return lhs.messageId == rhs.messageId
    }
}

extension MMessage: Comparable {
    static func < (lhs: MMessage, rhs: MMessage) -> Bool {
        return lhs.sentDate < rhs.sentDate
    }
}
