//
//  BerlinOfficeViewController.swift
//  HeroDemo
//
//  Created by Marco Maddalena on 02.12.18.
//  Copyright © 2018 Intive. All rights reserved.
//

import UIKit

protocol BerlinOfficeDelegate: AnyObject {
    func perform(action: BerlinOfficeAction)
}

enum BerlinOfficeAction {
    case showDetail(employee: Employee)
    case showGrid(berlinOfficeVC: BerlinOfficeViewController, employees: [Employee])
}

class BerlinOfficeViewController: UITableViewController {

    weak var delegate: BerlinOfficeDelegate?
    private var employees: [Employee] = BerlinOffice.load()?.employees ?? []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }

    @IBAction private func toGridDidPress(_ sender: Any) {
        delegate?.perform(action: .showGrid(berlinOfficeVC: self, employees: employees))
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeViewCell", for: indexPath) as! EmployeeViewCell
        cell.update(with: employees[indexPath.row])
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let employee = employees[indexPath.row]
        delegate?.perform(action: .showDetail(employee: employee))
    }
}
