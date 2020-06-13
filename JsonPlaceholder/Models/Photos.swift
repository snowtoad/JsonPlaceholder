//
//  Photos.swift
//  JsonPlaceholder
//
//  Created by apple on 2020/6/11.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

struct Photos: Codable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
