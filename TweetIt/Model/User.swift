//
//  User.swift
//  TweetIt
//
//  Created by Pritam Hinger on 14/12/17.
//  Copyright © 2017 AppDevelapp. All rights reserved.
//

import UIKit
import SwiftyJSON

struct User {
    let name: String
    let username: String
    let bioText: String
    let profileImageURL: String
    
    init(json: JSON) {
        self.name = json["name"].stringValue
        self.username = json["username"].stringValue
        self.bioText = json["bio"].stringValue
        self.profileImageURL = json["profileImageUrl"].stringValue
    }
}
