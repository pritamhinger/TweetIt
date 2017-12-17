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

class HomeDatasourceController: DatasourceController {
    
    let frame = CGRect(x: 0, y: 0, width: 32, height: 32)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.datasource = HomeDatasource()
        setUpNavigationBarItems()
    }
    
    func setUpNavigationBarItems() {
        setUpLeftNavItems()
        setUpRightNavItems()
        setUpRemainingNavItems()
    }
    
    private func setUpLeftNavItems(){
        let followButton = UIButton(type: .system)
        let imageView = UIImageView(image: #imageLiteral(resourceName: "icons8-add_administrator"))
        imageView.contentMode = .scaleAspectFit
        followButton.setImage(#imageLiteral(resourceName: "icons8-add_administrator").withRenderingMode(.alwaysOriginal), for: .normal)
        followButton.frame = frame
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: followButton)
    }
    
    private func setUpRightNavItems(){
        
        let searchButton = UIButton(type: .system)
        searchButton.setImage(#imageLiteral(resourceName: "icons8-search").withRenderingMode(.alwaysOriginal), for: .normal)
        searchButton.frame = frame
        let searchBarButton = UIBarButtonItem(customView: searchButton)
        
        let composeButton = UIButton(type: .system)
        composeButton.setImage(#imageLiteral(resourceName: "icons8-composing_mail_filled").withRenderingMode(.alwaysOriginal), for: .normal)
        composeButton.frame = frame
        let composeBarButton = UIBarButtonItem(customView: composeButton)

        navigationItem.rightBarButtonItems = [composeBarButton, searchBarButton]
    }
    
    private func setUpRemainingNavItems(){
        let titleImageView = UIImageView(image: #imageLiteral(resourceName: "icons8-twitter"))
        titleImageView.contentMode = .scaleAspectFit
        titleImageView.frame = frame
        navigationItem.titleView = titleImageView
        
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.backgroundColor = .white
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let user = self.datasource?.item(indexPath) as? User {
            print(user.bioText)
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
        return CGSize(width: view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
}
