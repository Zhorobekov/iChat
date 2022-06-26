//
//  FirestoreService.swift
//  iChat
//
//  Created by Эрмек Жоробеков on 25.06.2022.
//

import Firebase
import FirebaseFirestore

class FirestoreService {
    
    static let shared = FirestoreService()
    
    let db = Firestore.firestore()
    
    private var usersRef: CollectionReference {
        return db.collection("users")
    }
    
    func saveProfileWith(id: String, email: String, username: String?, avatarStringURL: String?, description: String?, sex: String?, completion: @escaping(Result<MUser, Error>) -> Void) {
       
        guard Validators.isFilled(username: username, description: description, sex: sex) else {
            completion(.failure(UserError.notFilled))
            return
        }
        
        let muser = MUser(id: id,
                          email: email,
                          username: username!,
                          avatarStringURL: avatarStringURL!,
                          description: description!,
                          sex: sex!)
        
        self.usersRef.document(muser.id).setData(muser.representation) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(muser))
            }
        }
    }
    
}
