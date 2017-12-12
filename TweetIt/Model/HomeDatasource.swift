//
//  HomeDatasource.swift
//  TweetIt
//
//  Created by Pritam Hinger on 12/12/17.
//  Copyright © 2017 AppDevelapp. All rights reserved.
//

import LBTAComponents

class HomeDatasource: Datasource {
    let words = ["user1", "user2", "user3"]
    
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
        return words[indexPath.row]
    }
    
    // Returning number of items in collection
    override func numberOfItems(_ section: Int) -> Int {
        return words.count
    }
}
