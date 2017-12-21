//
//  Tweet.swift
//  TweetIt
//
//  Created by Pritam Hinger on 17/12/17.
//  Copyright © 2017 AppDevelapp. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Tweet {
    let user: User
    let message: String
    
    init(json: JSON) {
        let userJson = json["user"]
        self.user = User(json: userJson)
        self.message = json["message"].stringValue
    }
}
