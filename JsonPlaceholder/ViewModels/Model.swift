//
//  Model.swift
//  JsonPlaceholder
//
//  Created by apple on 2020/6/12.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

struct Model {
    var id: Int
    var title: String
    var thumbnailURL: String
    
    init(photos photo: Photos) {
        self.id = photo.id
        self.title = photo.title
        self.thumbnailURL = photo.thumbnailUrl
    }
}
