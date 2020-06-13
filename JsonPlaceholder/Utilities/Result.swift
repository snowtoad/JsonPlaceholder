//
//  Result.swift
//  JsonPlaceholder
//
//  Created by apple on 2020/6/11.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

enum Result<T> {
    case Success(T)
    case Failure(String)
    case Error(String)
}
