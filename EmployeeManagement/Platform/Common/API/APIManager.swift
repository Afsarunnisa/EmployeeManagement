//
//  APIManager.swift
//  EmployeeManagement
//
//  Created by Md, Afsarunnisa on 10/04/19.
//  Copyright © 2019 Md, Afsarunnisa. All rights reserved.
//

import Foundation
import Alamofire


class APIManager : ApiClient {
       
    
    // MARK: - Protocol Properties
    static let shared = APIManager(baseURL:"")
    private var baseURL: String = ""
    private let sessionManager = Alamofire.SessionManager()
    typealias JSONTaskCompletionHandler = (Decodable?, APIError?) -> Void

    
    required init(baseURL: String) {
        self.baseURL = baseURL
    }
    
    
    private func decodingTask<T: Decodable>(with requestModel: APIRequestModel, decodingType: T.Type, completionHandler completion: @escaping JSONTaskCompletionHandler) -> DataRequest {
        
        
        let method = HTTPMethod(rawValue: requestModel.method.rawValue)!

        var encoding: ParameterEncoding
        if requestModel.paramsEncoding == .urlEncoded {
            encoding = URLEncoding.default
        } else {
            encoding = JSONEncoding.default
        }

        
//        let task =  sessionManager.request(request as! URLRequestConvertible)
        let task =  sessionManager.request(requestModel.url,
                                           method: method,
                                           parameters: requestModel.params,
                                           encoding: encoding,
                                           headers: requestModel.headers)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json;charset=utf-8"])
            .responseData { response in
                switch response.result {
                case .success(let data):
                    
                    do {
                        let genericModel = try JSONDecoder().decode(decodingType, from: data)
                        completion(genericModel, nil)
                    } catch {
                        completion(nil, .jsonConversionFailure)
                    }
                    
                case .failure(let error):
                        completion(nil, .responseUnsuccessful)
                }
        }
        
        return task
    }
    

    
    func MakeAsyncCall<T: Decodable>(with requestModel: APIRequestModel, decode: @escaping (Decodable) -> T?, completion: @escaping (Result<T, APIError>) -> Void) {
        
      //  let request = apiRequest(requestModel: requestModel)
        
        let task = decodingTask(with: requestModel, decodingType: T.self) { (json , error) in
            
            //MARK: change to main queue
            DispatchQueue.main.async {
                guard let json = json else {
                    if let error = error {
                        completion(Result.failure(error))
                    } else {
                        completion(Result.failure(.invalidData))
                    }
                    return
                }
                if let value = decode(json) {
                    completion(.success(value))
                } else {
                    completion(.failure(.jsonParsingFailure))
                }
            }
        }
        task.resume()
    }

    
    func apiRequest(requestModel : APIRequestModel) -> DataRequest {
        // Insert your common headers here, for example, authorization token or accept.
        // all common headers and tokens we can add here
        
        let method = HTTPMethod(rawValue: requestModel.method.rawValue)!

//        var request1: NSURLRequest = NSURLRequest(requestModel.url, method: method, parameters: requestModel.params, encoding: requestModel.paramsEncoding as! ParameterEncoding, headers: requestModel.headers)

        var encoding: ParameterEncoding
        if requestModel.paramsEncoding == .urlEncoded {
            encoding = URLEncoding.default
        } else {
            encoding = JSONEncoding.default
        }

        
        return request(requestModel.url, method: method, parameters: requestModel.params, encoding: encoding, headers: requestModel.headers);
        
    }
  
//    func apiRequest<T>(endpoint: String,method : HTTPMethod, parameters: T? = nil) -> Request {
//        // Insert your common headers here, for example, authorization token or accept.
//
//        var commonHeaders = ["Accept" : "application/json"]
//
////        let allHeaders = commonHeaders + headers
////        if let headers = headers {
////            commonHeaders = commonHeaders + headers
////        }
//
//        return request(endpoint, method: method, parameters: parameters, encoding: URLEncoding.default, headers: commonHeaders);
//    }

    
}



