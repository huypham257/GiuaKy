//
//  MainTabBarController.swift
//  GiuaKy
//
//  Created by Huy Pham on 8/18/18.
//  Copyright © 2018 Huy Pham. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let friendViewController = FriendsViewController()
        friendViewController.tabBarItem = UITabBarItem(title: "Friends", image: nil, tag: 0)
        friendViewController.title = "Friends"
        let friendNav = friendViewController.embededNavigationController()
        
        let userProfileController = UserDataViewController()
        userProfileController.tabBarItem = UITabBarItem(title: "User", image: nil, tag: 1)
        userProfileController.title = "Profile"
        let userProfileNav = userProfileController.embededNavigationController()
        
        self.viewControllers = [friendNav, userProfileNav]
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
