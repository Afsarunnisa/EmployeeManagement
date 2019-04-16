//
//  EmployeesListInteractor.swift
//  EmployeeManagement
//
//  Created by Md, Afsarunnisa on 09/04/19.
//  Copyright © 2019 Md, Afsarunnisa. All rights reserved.
//

import Foundation
import UIKit

protocol EmployeesListBusinessLogic
{
    func fetchAllEmployees(request: EmployeesList.FetchEmployees.Request)
}

protocol EmployeesListDataPassing
{
    var employees: [Employee]? { get }
}



class EmployeesListInteractor: NSObject, EmployeesListBusinessLogic, EmployeesListDataPassing
{
    var employees: [Employee]?
    
    // create a worker to get the list of employees
    
    var presenter: EmployeesListPresenter?
    var worker: EmployeeListWorker?
    
    
    func fetchAllEmployees(request: EmployeesList.FetchEmployees.Request)
    {
     
        worker = EmployeeListWorker()

        worker?.getAllEmployees{ result in
            
            switch result {
            case .success(let success):
                print(success!)
                
                self.presenter?.presentEmployeesList(response: success!)

                
//                let optData = try? EmployeesList.FetchEmployees.Response(from: success as! Decoder)
//                guard let data = optData else {
//                    return
//                }
//
//                self.presenter?.presentEmployeesList(response: optData!)

                
                
            case .failure(let error):
                print("the error \(error)")
            }
            

        }
        
        
        
    }

}
