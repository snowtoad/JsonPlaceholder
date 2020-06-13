//
//  ResultCollectionViewCell.swift
//  JsonPlaceholder
//
//  Created by apple on 2020/6/11.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class ResultCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var thumbnailURL: UIImageView!
    
    static let nibName = "ResultCollectionViewCell"
    
    func configure(_ model: Model?) {
        guard let model = model else { return }
        //ImageView
        thumbnailURL.image = #imageLiteral(resourceName: "placeholder")
        thumbnailURL.downloadImage(model.thumbnailURL)
        //Label
        id.text = String(model.id)
        title.text = model.title
    }
}
