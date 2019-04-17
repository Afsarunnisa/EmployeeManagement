//
//  EmployeesListWorker.swift
//  EmployeeManagement
//
//  Created by Md, Afsarunnisa on 09/04/19.
//  Copyright © 2019 Md, Afsarunnisa. All rights reserved.
//

import Foundation

class EmployeeListWorker {
  
    
    // MARK: - Protocol Properties
    static let shared = EmployeeListWorker()

    func getAllEmployees(completion: @escaping (Result<EmployeesList.FetchEmployees.Response?, APIError>) -> Void) {

        let apiModel = APIRequestModel(method: .get,
                                url: "https://reqres.in/api/users",
                                headers: nil,
                                params: nil,
                                paramsEncoding: .json)

       APIManager.shared.MakeAsyncCall(with : apiModel, decode: { json -> EmployeesList.FetchEmployees.Response? in
            guard let response = json as? EmployeesList.FetchEmployees.Response else { return  nil }
            return response
        }, completion: completion)

        
//        fetch(with: request, decode: { json -> MovieFeedResult? in
//            guard let movieFeedResult = json as? MovieFeedResult else { return  nil }
//            return movieFeedResult
//        }, completion: completion)

        
    }
    
}
