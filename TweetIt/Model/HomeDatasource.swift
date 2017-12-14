//
//  HomeDatasource.swift
//  TweetIt
//
//  Created by Pritam Hinger on 12/12/17.
//  Copyright © 2017 AppDevelapp. All rights reserved.
//

import LBTAComponents

class HomeDatasource: Datasource {
    let users: [User] = {
        let myUser = User(name: "Pritam Hinger", username: "@pritamhinger", bioText: "An ios developer by passion. Contact to get a beautifully hand crafted app for your business house. Write us at artist@appdevelapp.com or tweet us @pritamhinger", profileImage: #imageLiteral(resourceName: "profile_picture"))
        let brianUser = User(name: "Brain Voong", username: "@buildthatapp", bioText: "iPhone, iPad, iOS Programming Community. Join us to learn Swift, Objective-C and build iOS apps!", profileImage: #imageLiteral(resourceName: "icons8-twitter"))
        return [myUser, brianUser]
    }()
    
    //let words = ["user1", "user2", "user3"]
    
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
        return [HomeCell.self]
    }
    
    // Return item at the collection at index path
    override func item(_ indexPath: IndexPath) -> Any? {
        return users[indexPath.row]
    }
    
    // Returning number of items in collection
    override func numberOfItems(_ section: Int) -> Int {
        return users.count
    }
}
