//
//  APIModels.swift
//  EmployeeManagement
//
//  Created by Md, Afsarunnisa on 10/04/19.
//  Copyright © 2019 Md, Afsarunnisa. All rights reserved.
//

import Foundation

enum Result<T, U> where U: Error  {
    case success(T)
    case failure(U)
}
