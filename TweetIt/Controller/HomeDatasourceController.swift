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
    
    let errorMessageLabel: UILabel = {
        let label = UILabel()
        label.text = "Something went wrong. Please try again after some time...!!"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.isHidden = true
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(errorMessageLabel)
        errorMessageLabel.fillSuperview()
        
        collectionView?.backgroundColor = UIColor(r: 232, g: 236, b: 241)    
        setUpNavigationBarItems()
        
        TweetService.sharedInstance.getHomeDate(onCompletion: {(homeDatasource, err) -> Void in
            if let err = err{
                self.errorMessageLabel.isHidden = false
                
                if let apiError = err as? APIError<TweetService.JSONError>{
                    if apiError.response?.statusCode != 200{
                        self.errorMessageLabel.text = "Reposnse Status code is not 200"
                    }
                }
                
                return
            }
            
            self.datasource = homeDatasource
        })
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 0{
            guard let user = self.datasource?.item(indexPath) as? User else{ return .zero }
            
            let estimatedHeight = estimatedHeightOfCell(withText: user.bioText)
            return CGSize(width: view.frame.width, height: estimatedHeight + 66)
        } else if indexPath.section == 1{
            guard let tweet = self.datasource?.item(indexPath) as? Tweet else{ return .zero }
            let estimatedHeight = estimatedHeightOfCell(withText: tweet.message)
            return CGSize(width: view.frame.width, height: estimatedHeight + 74)
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
    
    private func estimatedHeightOfCell(withText text:String) -> CGFloat {
        // - 12 - 50 - 12 = -74
        let approximateWidthOfBioTextView = view.frame.width - 76
        let size = CGSize(width: approximateWidthOfBioTextView, height: 1000)
        let atributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)]
        let estimatedSize = NSString(string: text).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: atributes, context: nil)
        return estimatedSize.height
    }
}
