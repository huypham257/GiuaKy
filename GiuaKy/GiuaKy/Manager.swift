//
//  Manager.swift
//  GiuaKy
//
//  Created by Huy Pham on 8/18/18.
//  Copyright © 2018 Huy Pham. All rights reserved.
//

import Foundation
import UIKit

class Manager {
    
    static func goToAuthenticatedController() {
        let mainTabBarController = MainTabBarController()
        UIApplication.shared.keyWindow?.rootViewController = mainTabBarController
        UIApplication.shared.keyWindow?.makeKeyAndVisible()
    }
    
    static func goToAuthenticationController() {
        let vc = LoginViewController()
        UIApplication.shared.keyWindow?.rootViewController = vc
        UIApplication.shared.keyWindow?.makeKeyAndVisible()
    }
    
}
