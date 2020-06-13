//
//  PhotosSearchService.swift
//  JsonPlaceholder
//
//  Created by apple on 2020/6/12.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class PhotosSearchService: NSObject {
    
    /// - Parameters:
    ///   - pageNo: which page
    ///   - perAmount: page Amount
    ///   - completion: completion handler to retrieve result
    func request(_ pageNo: Int, perAmount: Int, completion: @escaping (Result<[Photos]?>) -> Void) {
        
        guard let request = PhotosRequestConfig.searchRequest(pageNo, perAmount).value else {
            return
        }
        
        NetworkManager.shared.request(request) { (result) in
            switch result {
            case .Success(let responseData):
                if let model = self.processResponse(responseData) {
                    completion(.Success(model))
                } else {
                    return completion(.Failure(NetworkManager.errorMessage))
                }
            case .Failure(let message):
                return completion(.Failure(message))
            case .Error(let error):
                return completion(.Failure(error))
            }
        }
    }
    
    func processResponse(_ data: Data) -> [Photos]? {
        do {
            let responseModel = try JSONDecoder().decode([Photos].self, from: data)
            return responseModel
            
        } catch {
            print("Data parsing error: \(error.localizedDescription)")
            return nil
        }
    }
}

