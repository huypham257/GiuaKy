//
//  String.swift
//  GiuaKy
//
//  Created by Huy Pham on 8/17/18.
//  Copyright © 2018 Huy Pham. All rights reserved.
//

import Foundation
extension String {
    
    var isEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let predicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return predicate.evaluate(with: self)
    }
}
