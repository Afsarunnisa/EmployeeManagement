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
    public let first_name : String
    public let last_name: String
    public let avatar: String
    
    public init(id: Int,
                first_name: String,
                last_name: String,
                avatar: String) {
        self.id = id
        self.first_name = first_name
        self.last_name = last_name
        self.avatar = avatar
    }
}

