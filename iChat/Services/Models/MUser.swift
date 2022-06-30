//
//  MUser.swift
//  iChat
//
//  Created by Эрмек Жоробеков on 11.06.2022.
//

import Foundation
import FirebaseFirestore


struct MUser: Hashable, Decodable {
    var id: String
    var email: String?
    var username: String
    var avatarStringURL: String
    var description: String?
    var sex: String?
    
    init(id: String, email: String, username: String, avatarStringURL: String, description: String, sex: String) {
        self.id = id
        self.email = email
        self.username = username
        self.avatarStringURL = avatarStringURL
        self.description = description
        self.sex = sex
    }
    
    init?(document: DocumentSnapshot) {
        guard let data = document.data() else { return nil }
        guard let username = data["username"] as? String,
        let email = data["email"] as? String,
        let avatarStringURL = data["avatarStringURL"] as? String,
        let description = data["description"] as? String,
        let sex = data["sex"] as? String,
        let id = data["uid"] as? String else { return nil }
        
        self.username = username
        self.email = email
        self.avatarStringURL = avatarStringURL
        self.description = description
        self.sex = sex
        self.id = id
    }
    
    var representation: [String : Any] {
        var rep = ["uid" : id]
        rep["email"] = email
        rep["username"] = username
        rep["avatarStringURL"] = avatarStringURL
        rep["description"] = description
        rep["sex"] = sex
        return rep
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: MUser, rhs: MUser) -> Bool {
        return lhs.id == rhs.id
    }
    
    func contains(filter: String?) -> Bool {
        guard let filter = filter else { return true }
        if filter.isEmpty { return true }
        let lowercasedFilter = filter.lowercased()
        return username.lowercased().contains(lowercasedFilter)
    }
}
