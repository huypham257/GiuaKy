//
//  Firebase.swift
//  GiuaKy
//
//  Created by Huy Pham on 8/18/18.
//  Copyright © 2018 Huy Pham. All rights reserved.
//

import Foundation
import FirebaseDatabase

class FIRManager {
    
    static let shared: FIRManager = FIRManager()
    
    let ref: DatabaseReference
    var userRef: DatabaseReference {
        return ref.child("users")
    }
    
    private init() {
        ref = Database.database().reference().child("hellofirebaseapp")
    }
    
}
