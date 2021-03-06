//
//  HomeDatasourceControllerExtension.swift
//  TweetIt
//
//  Created by Pritam Hinger on 17/12/17.
//  Copyright © 2017 AppDevelapp. All rights reserved.
//

import UIKit

extension HomeDatasourceController{
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
        
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        let navBarSeparatorView = UIView()
        navBarSeparatorView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        view.addSubview(navBarSeparatorView)
        navBarSeparatorView.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.leftAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0.5)
    }
}
