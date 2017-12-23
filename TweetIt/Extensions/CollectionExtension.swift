//
//  CollectionExtension.swift
//  TweetIt
//
//  Created by Pritam Hinger on 23/12/17.
//  Copyright © 2017 AppDevelapp. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

extension Collection where Iterator.Element == JSON{
    func decode<T: JSONDecodable>() throws -> [T] {
        return try map({ try T(json: $0)})
    }
}
