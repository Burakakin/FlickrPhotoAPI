//
//  Result.swift
//  FlickrNetworking
//
//  Created by Burak Akin on 12.08.2019.
//  Copyright © 2019 Burak Akin. All rights reserved.
//

import Foundation

enum Result<T, U> where U: Error  {
    case success(T)
    case failure(U)
}
