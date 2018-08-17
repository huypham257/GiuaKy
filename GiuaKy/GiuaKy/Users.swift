//
//  Users.swift
//  GiuaKy
//
//  Created by Huy Pham on 8/18/18.
//  Copyright © 2018 Huy Pham. All rights reserved.
//

import Foundation
import FirebaseAuth
import FBSDKLoginKit
import GoogleSignIn

class UserManager {
    
    static let share: UserManager = UserManager()
    
    private init(){
        
    }
    
    public func getCurrenUser() -> User? {
        return Auth.auth().currentUser
    }
    
    public func signOut() {
        try! Auth.auth().signOut()
        FBSDKLoginManager().logOut()
        GIDSignIn.sharedInstance().signOut()
        
        Manager.goToAuthenticationController()
    }
}
