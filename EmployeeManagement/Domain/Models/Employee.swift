//
//  Employee.swift
//  EmployeeManagement
//
//  Created by Md, Afsarunnisa on 09/04/19.
//  Copyright © 2019 Md, Afsarunnisa. All rights reserved.
//

import Foundation

public struct Employee : Codable{
    
    public let id: Int
    public let name : String
    public let salary: String
    public let age: String
    public let profileimage: String
    
    public init(id: Int,
                name: String,
                salary: String,
                age: String,
                profileimage: String) {
        self.id = id
        self.name = name
        self.salary = salary
        self.age = age
        self.profileimage = profileimage
    }
}

