//
//  EmployeesListViewController.swift
//  EmployeeManagement
//
//  Created by Md, Afsarunnisa on 09/04/19.
//  Copyright © 2019 Md, Afsarunnisa. All rights reserved.
//

import Foundation
import UIKit

protocol ShowEmployeesListDisplayLogic: class {
    func displayEmployees(viewModel: EmployeesList.FetchEmployees.ViewModel)
}



class EmployeesListViewController: UIViewController, ShowEmployeesListDisplayLogic{
    
    @IBOutlet weak var employeeListTableView: UITableView!
    
    
    var interactor: EmployeesListBusinessLogic?
    var router: EmployeesListRouter?
    var employees = [Employee]()

    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }
    
    
    // MARK: Setup
    
    private func setup()
    {
        let viewController = self
        let interactor = EmployeesListInteractor()
        let presenter = EmployeesListPresenter()
        let router = EmployeesListRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController

        router.viewController = viewController
      //  router.dataStore = interactor
    }

    // MARK: View lifecycle
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadEmployees()
    }

    // MARK: - Private methods
    private func loadEmployees() {
        let request = EmployeesList.FetchEmployees.Request()
        interactor?.fetchAllEmployees(request: request)
    }

    
    
    func displayEmployees(viewModel: EmployeesList.FetchEmployees.ViewModel) {
        
        
        employees = viewModel.employees
        employeeListTableView.reloadData()

        
    }
}


// MARK: - Extension UITableViewDelegate
extension EmployeesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard tableView.cellForRow(at: indexPath) != nil else {
            return
        }
//        router?.routeToDetails()
    }
}


// MARK: - Extension UITableViewDataSource
extension EmployeesListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        var cell = tableView.dequeueReusableCell(withIdentifier: "employeeCell")
        if cell == nil {
            cell = UITableViewCell(style: .value1, reuseIdentifier: "employeeCell")
        }
        cell?.textLabel?.text = employees[indexPath.row].name

        return cell!
    }
}
