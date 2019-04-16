//
//  EmployeesListPresenter.swift
//  EmployeeManagement
//
//  Created by Md, Afsarunnisa on 09/04/19.
//  Copyright © 2019 Md, Afsarunnisa. All rights reserved.
//

import Foundation

protocol EmployeesListPresentationLogic {
    func presentEmployeesList(response: EmployeesList.FetchEmployees.Response)
}


class EmployeesListPresenter : EmployeesListPresentationLogic {
    
    weak var viewController: ShowEmployeesListDisplayLogic?

    func presentEmployeesList(response: EmployeesList.FetchEmployees.Response) {
        
        print(response.response);
        
        let viewModel = EmployeesList.FetchEmployees.ViewModel.init(employees: response.response)
        viewController?.displayEmployees(viewModel: viewModel)
    }

    
    
}
