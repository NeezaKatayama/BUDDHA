//
//  AppUser.swift
//  abseil
//
//  Created by 片山義仁 on 2019/12/11.
//


import Foundation
import Firebase

struct AppUser {
    let userID: String

    init(data: [String: Any]) {
        userID = data["userID"] as! String
    }
}
