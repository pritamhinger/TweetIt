//
//  TweetService.swift
//  TweetIt
//
//  Created by Pritam Hinger on 21/12/17.
//  Copyright © 2017 AppDevelapp. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

struct TweetService {
    
    let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")
    
    static let sharedInstance = TweetService()
    
    func getHomeDate(onCompletion: @escaping (HomeDatasource?, Error?) -> ()) {
        let request: APIRequest<HomeDatasource, JSONError> = tron.swiftyJSON.request("twitter/home")
        request.perform(withSuccess: {homeDatasource in
            onCompletion(homeDatasource, nil)
        }, failure: {err in
            onCompletion(nil, err)
        })
    }
    
    class JSONError: JSONDecodable{
        required init(json: JSON) throws {
            
        }
    }
}
