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
    
    var users: [User]
    required init(json: JSON) throws {
        let usersArray = json["users"].array
        users = []
        
        guard let usersJSON = usersArray else { return }
        
        for userJSON in usersJSON {
            let name = userJSON["name"].stringValue
            let username = userJSON["username"].stringValue
            let bio = userJSON["bio"].stringValue
            
            let user = User(name: name, username: username, bioText: bio, profileImage: UIImage())
            self.users.append(user)
        }
    }
    
    let tweets: [Tweet] = {
        let myUser = User(name: "Pritam Hinger", username: "@pritamhinger", bioText: "An ios developer by passion. Contact to get a beautifully hand crafted app for your business house. Write us at artist@appdevelapp.com or tweet us @pritamhinger", profileImage: #imageLiteral(resourceName: "profile_picture"))
        
        let tweet1 = Tweet(user: myUser, message: "This is the first tweet of the series. ")
        let tweet2 = Tweet(user: myUser, message: "After the successful first tweet, here comes the second tweet of the series. This tweet is a bit longer than the previous one to show if dynamic resizing still working or not. If you can see this line that means it is working.")
        let tweet3 = Tweet(user: myUser, message: "This is the last tweet of the series. Hope everything is working as expected...!!")
        
        return [tweet1, tweet2, tweet3]
    }()
    
    //let tweets = ["tweet1", "tweet2"]
    
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
            return tweets[indexPath.item]
        }
        
        return users[indexPath.row]
    }
    
    // Returning number of items in collection
    override func numberOfItems(_ section: Int) -> Int {
        if section == 1{
            return tweets.count
        }
        
        return users.count
    }
    
    override func numberOfSections() -> Int {
        return 2
    }
}
