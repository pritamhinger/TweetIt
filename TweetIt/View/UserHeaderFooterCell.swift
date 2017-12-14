//
//  CustomCells.swift
//  TweetIt
//
//  Created by Pritam Hinger on 12/12/17.
//  Copyright © 2017 AppDevelapp. All rights reserved.
//

import LBTAComponents

let color = UIColor(r: 61, g: 167, b: 244)

class HomeHeader: DatasourceCell{
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "WHO TO FOLLOW"
        label.font = UIFont.systemFont(ofSize: 16)
        
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        addSubview(headerLabel)
        headerLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}

class HomeFooter: DatasourceCell {
    let footerLabel: UILabel = {
        let label = UILabel()
        label.text = "Show me more"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = color
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(footerLabel)
        footerLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightConstant: 8, widthConstant: 0, heightConstant: 0)
    }
}
