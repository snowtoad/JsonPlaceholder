//
//  PhotosModel.swift
//  JsonPlaceholder
//
//  Created by apple on 2020/6/12.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class PhotosViewModel: NSObject {

    private(set) var photoArray = [Photos]()
    private var perAmount = 100
    private var pageNo = 1
    private var totalPage = 50
    
    var showAlert: ((String) -> Void)?
    var dataUpdated: (() -> Void)?
    
    func search(completion:@escaping () -> Void) {
        photoArray.removeAll()
        fetchResults(completion: completion)
    }
    
    private func fetchResults(completion:@escaping () -> Void) {
        
        guard #available(iOS 13.0, *) else {
            return UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
        
        PhotosSearchService().request(pageNo, perAmount: perAmount) { (result) in
        
            GCD.runOnMainThread {
            
                guard #available(iOS 13.0, *) else {
                    return UIApplication.shared.isNetworkActivityIndicatorVisible = false
                }
                
                switch result {
                case .Success(let results):
                    if let result = results {
                        self.photoArray.append(contentsOf: result)
                        self.dataUpdated?()
                    }
                    completion()
                case .Failure(let message):
                    self.showAlert?(message)
                    completion()
                case .Error(let error):
                    if self.pageNo > 1 {
                        self.showAlert?(error)
                    }
                    completion()
                }
            }
        }
    }
    
    func fetchNextPage(completion:@escaping () -> Void) {
        if pageNo < totalPage {
                pageNo += 1
                fetchResults {
                    completion()
            }
        } else {
            completion()
        }
    }
}

