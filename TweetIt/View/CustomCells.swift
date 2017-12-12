//
//  CustomCells.swift
//  TweetIt
//
//  Created by Pritam Hinger on 12/12/17.
//  Copyright © 2017 AppDevelapp. All rights reserved.
//

import LBTAComponents

class HomeHeader: DatasourceCell{
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Header Title"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .white
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = .blue
        
        addSubview(headerLabel)
        headerLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}

class HomeFooter: DatasourceCell {
    let footerLabel: UILabel = {
        let label = UILabel()
        label.text = "Footer Notes"
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.purple
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = .green
        
        addSubview(footerLabel)
        footerLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 8, widthConstant: 0, heightConstant: 0)
    }
}

class HomeCell: DatasourceCell {
    
    override var datasourceItem: Any?{
        didSet{
            titleLabel.text = datasourceItem as? String
        }
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Test Test Test"
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = .yellow
        
        addSubview(titleLabel)
        titleLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}
