//
//  ApiClient.swift
//  EmployeeManagement
//
//  Created by Md, Afsarunnisa on 10/04/19.
//  Copyright © 2019 Md, Afsarunnisa. All rights reserved.
//

import Foundation


protocol ApiClient {
    func MakeAsyncCall<T: Decodable>(with requestModel: APIRequestModel, decode: @escaping (Decodable) -> T?, completion: @escaping (Result<T, APIError>) -> Void)
    
    init(baseURL: String)

}

