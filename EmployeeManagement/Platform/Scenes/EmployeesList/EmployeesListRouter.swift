//
//  EmployeesListRouter.swift
//  EmployeeManagement
//
//  Created by Md, Afsarunnisa on 09/04/19.
//  Copyright © 2019 Md, Afsarunnisa. All rights reserved.
//

import Foundation
import UIKit


@objc protocol EmployeesListRoutingLogic
{
    func routeToCreateEmployee(segue: UIStoryboardSegue?)
    func routeToDisplayEmployee(segue: UIStoryboardSegue?)
}


class EmployeesListRouter: NSObject, EmployeesListRoutingLogic
{
    weak var viewController: EmployeesListViewController?
//    var dataStore: EmployeesListDataStore?
//
//
//    // MARK: Routing
//
//    func routeToCreateEmployee(segue: UIStoryboardSegue?)
//    {
//        if let segue = segue {
//            let destinationVC = segue.destination as! CreateEmployeeViewController
//            var destinationDS = destinationVC.router!.dataStore!
//            passDataToCreateOrder(source: dataStore!, destination: &destinationDS)
//        } else {
//            let destinationVC = viewController?.storyboard?.instantiateViewController(withIdentifier: "CreateEmployeeViewController") as! CreateEmployeeViewController
//            var destinationDS = destinationVC.router!.dataStore!
//            passDataToCreateOrder(source: dataStore!, destination: &destinationDS)
//            navigateToCreateOrder(source: viewController!, destination: destinationVC)
//        }
//    }

    func routeToCreateEmployee(segue: UIStoryboardSegue?){
        
    }
    
    func routeToDisplayEmployee(segue: UIStoryboardSegue?){
        
    }

}
