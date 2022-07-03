//
//  MChatModel.swift
//  iChat
//
//  Created by Эрмек Жоробеков on 10.06.2022.
//

import Foundation
import FirebaseFirestore

struct MChat: Hashable, Decodable {
    var friendUsername: String
    var friendAvatarStringURL: String
    var lastMessageContent: String
    var friendId: String
    
    var representation: [String : Any] {
        var representation = ["friendUserName" : friendUsername]
        representation["friendAvatarStringURL"] = friendAvatarStringURL
        representation["lastMessage"] = lastMessageContent
        representation["friendId"] = friendId
        return representation
    }
    
    init(friendUsername: String, friendAvatarStringURL: String, lastMessageContent: String, friendId: String) {
        self.friendUsername = friendUsername
        self.friendAvatarStringURL = friendAvatarStringURL
        self.lastMessageContent = lastMessageContent
        self.friendId = friendId
    }
    
    init?(document: QueryDocumentSnapshot) {
        let data = document.data()
        guard let friendUsername = data["friendUserName"] as? String,
        let friendAvatarStringURL = data["friendAvatarStringURL"] as? String,
        let lastMessageContent = data["lastMessage"] as? String,
        let friendId = data["friendId"] as? String else { return nil }
        
        self.friendUsername = friendUsername
        self.friendAvatarStringURL = friendAvatarStringURL
        self.friendId = friendId
        self.lastMessageContent = lastMessageContent
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(friendId)
    }
    
    static func == (lhs: MChat, rhs: MChat) -> Bool {
        return lhs.friendId == rhs.friendId
    }
}
