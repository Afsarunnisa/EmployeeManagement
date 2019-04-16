//
//  EmployeesUsecases.swift
//  EmployeeManagement
//
//  Created by Md, Afsarunnisa on 09/04/19.
//  Copyright © 2019 Md, Afsarunnisa. All rights reserved.
//

import Foundation
public protocol EmployeesUsecases {
    
    func getAllEmployees() -> [Employee]
    func getEmployeeById(employeeID : Int)
    func addEmployee(Employee: Employee)
    func deleteEmployeeById(employeeID : Int)
    func updateEmployeeById(employeeID : Int)


    
}
