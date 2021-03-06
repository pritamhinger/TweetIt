//
//  HomeDatasource.swift
//  TweetIt
//
//  Created by Pritam Hinger on 12/12/17.
//  Copyright © 2017 AppDevelapp. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

class HomeDatasource: Datasource, JSONDecodable {
    
    var usersIntance = [User]()
    var tweetsInstance = [Tweet]()

    required init(json: JSON) throws {
        
        guard let usersJSON = json["users"].array, let tweetsJSON = json["tweets"].array else {
            throw NSError(domain: "com.appdevelapp", code: 1, userInfo: [NSLocalizedDescriptionKey : "'users' json is invalid"])
        }
        
        self.usersIntance = try usersJSON.decode()
        self.tweetsInstance = try tweetsJSON.decode()
    }
    
    // Setting Custom Header Class
    override func headerClasses()
        -> [DatasourceCell.Type]? {
            return [HomeHeader.self]
    }
    
    // Setting Custom Footer Class
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [HomeFooter.self]
    }
    
    // Setting Custom Cell Class
    override func cellClasses() -> [DatasourceCell.Type] {
        return [HomeCell.self, TweetCell.self]
    }
    
    // Return item at the collection at index path
    override func item(_ indexPath: IndexPath) -> Any? {
        if indexPath.section == 1{
            return tweetsInstance[indexPath.item]
        }
        
        return usersIntance[indexPath.row]
    }
    
    // Returning number of items in collection
    override func numberOfItems(_ section: Int) -> Int {
        if section == 1{
            return tweetsInstance.count
        }
        
        return usersIntance.count
    }
    
    override func numberOfSections() -> Int {
        return 2
    }
}
