//
//  HomeDatasourceController.swift
//  TweetIt
//
//  Created by Pritam Hinger on 12/12/17.
//  Copyright © 2017 AppDevelapp. All rights reserved.
//

import UIKit
import Foundation
import LBTAComponents
import TRON
import SwiftyJSON

class HomeDatasourceController: DatasourceController {
    
    let frame = CGRect(x: 0, y: 0, width: 34, height: 34)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = UIColor(r: 232, g: 236, b: 241)    
        setUpNavigationBarItems()
        
        TweetService.sharedInstance.getHomeDate(onCompletion: {homeDataSource in
            self.datasource = homeDataSource
        })
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let user = self.datasource?.item(indexPath) as? User {
            // - 12 - 50 - 12 = -74
            let approximateWidthOfBioTextView = view.frame.width - 76
            let size = CGSize(width: approximateWidthOfBioTextView, height: 1000)
            let atributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)]
            let estimatedSize = NSString(string: user.bioText).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: atributes, context: nil)
            return CGSize(width: view.frame.width, height: estimatedSize.height + 66)
        }
        
        return CGSize(width: view.frame.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 1{
            return .zero
        }
        
        return CGSize(width: view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 1{
            return .zero
        }
        
        return CGSize(width: view.frame.width, height: 64)
    }
}
