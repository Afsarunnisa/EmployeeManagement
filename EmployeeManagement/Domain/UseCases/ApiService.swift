//
//  ApiService.swift
//  EmployeeManagement
//
//  Created by Md, Afsarunnisa on 10/04/19.
//  Copyright © 2019 Md, Afsarunnisa. All rights reserved.
//

import Foundation

protocol ApiService {
    
    var base: String { get }
    var path: String { get }

    
//    func MakeAsyncRequest<T>(endPoint : String, method : String, params : Dictionary<String, AnyObject>, completion:  ((Result<T>) -> Void)?)
}


extension ApiService {
  
    // if we have keys and tokens, we can define here
    
    var apiKey: String {
        return "api_key"
    }
    
    var urlComponents: URLComponents {
        var components = URLComponents(string: base)!
        components.path = path
        components.query = apiKey
        return components
    }
    
    var request: URLRequest {
        let url = urlComponents.url!
        return URLRequest(url: url)
    }
}
