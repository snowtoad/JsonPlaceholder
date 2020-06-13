//
//  PhotosConfig.swift
//  JsonPlaceholder
//
//  Created by apple on 2020/6/12.
//  Copyright © 2020 apple. All rights reserved.
//

import Foundation

enum PhotosRequestConfig {
    
    case searchRequest(Int, Int)
    
    var value: Request? {
        
        switch self {
            
        case .searchRequest(let pageNo, let perAmount):
            let urlString = String(format: PhotosConstants.searchURL, pageNo, perAmount)
            let reqConfig = Request.init(requestMethod: .get, urlString: urlString)
            return reqConfig
        }
    }
}
