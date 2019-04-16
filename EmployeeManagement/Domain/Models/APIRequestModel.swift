//
//  APIRequestModel.swift
//  EmployeeManagement
//
//  Created by Md, Afsarunnisa on 10/04/19.
//  Copyright © 2019 Md, Afsarunnisa. All rights reserved.
//

import Foundation

struct APIRequestModel {
   
    enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
    }
    enum Encoding {
        case urlEncoded
        case json
    }
    var method: HTTPMethod
    var url: String
    var headers: [String: String]?
    var params: [String: Any]?
    var paramsEncoding: Encoding
}
