//
//  MChatModel.swift
//  iChat
//
//  Created by Эрмек Жоробеков on 10.06.2022.
//

import Foundation

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
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(friendId)
    }
    
    static func == (lhs: MChat, rhs: MChat) -> Bool {
        return lhs.friendId == rhs.friendId
    }
}
