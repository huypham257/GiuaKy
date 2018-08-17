//
//  FriendsViewController.swift
//  GiuaKy
//
//  Created by Huy Pham on 8/18/18.
//  Copyright © 2018 Huy Pham. All rights reserved.
//

import UIKit

class FriendsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    enum UserStatus: Int {
        case online
        case offline
        case busy
        
        var backgroundColor: UIColor {
            switch self {
            case .online:
                return .green
            case .offline:
                return .lightGray
            case .busy:
                return .red
            }
        }
    }
    
    var users: [(id: String, email: String, status: UserStatus)] = []
    var tableView: UITableView = UITableView(frame: .zero, style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        self.tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        let barButton = UIBarButtonItem(title: "Status", style: .plain, target: self, action: #selector(changeStatus))
        self.navigationItem.rightBarButtonItem = barButton
    }
    
    var startStatus = 0 {
        didSet {
            if startStatus > 2 {
                self.startStatus = 0
            }
        }
    }
    
    @objc func changeStatus() {
        startStatus += 1
        FIRManager.shared.userRef.child(UserManager.share.getCurrenUser()?.uid ?? "i").child("status").setValue(startStatus)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        FIRManager.shared.userRef.observe(.value) { (snapshot) in
            guard let usersDict = snapshot.value as? [String: Any] else {return}
            self.users.removeAll()
            for (_, value) in usersDict {
                if let userDict = value as? [String: Any],
                    let id = userDict["id"] as? String,
                    let email = userDict["email"] as? String  {
                    
                    let statusInt = userDict["status"] as? Int ?? 0
                    let user = (id: id, email: email, status: UserStatus(rawValue: statusInt) ?? .online)
                    self.users.append(user)
                }
                
                self.tableView.reloadData()
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let user = self.users[indexPath.row]
        cell.textLabel?.text = user.id
        cell.detailTextLabel?.text = user.email
        cell.backgroundColor = user.status.backgroundColor
        return cell
    }
}
