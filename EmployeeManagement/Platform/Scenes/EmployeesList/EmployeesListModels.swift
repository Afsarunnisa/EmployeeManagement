//
//  EmployeesListModels.swift
//  EmployeeManagement
//
//  Created by Md, Afsarunnisa on 09/04/19.
//  Copyright © 2019 Md, Afsarunnisa. All rights reserved.
//

import Foundation

// MARK: Use cases

enum EmployeesList
{

    enum FetchEmployees
    {
        struct Request
        {
        }
        struct Response : Decodable
        {
            var page : Int
            var per_page : Int
            var total : Int
            var total_pages : Int
            var data : [Employee]
            
        }
        
        struct ViewModel
        {
            var employees : [Employee]
        }
    }
}
