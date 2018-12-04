//
//  EmployeeDetailViewController.swift
//  HeroDemo
//
//  Created by Marco Maddalena on 02.12.18.
//  Copyright © 2018 Intive. All rights reserved.
//

import UIKit

class EmployeeDetailViewController: UIViewController {

    @IBOutlet private weak var profileImage: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var lastNameLabel: UILabel!
    @IBOutlet private weak var roleLabel: UILabel!

    var employee: Employee?

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpStyles()
        setUpUI()
    }

    private func setUpStyles() {
        profileImage.clipsToBounds = true
        profileImage.layer.cornerRadius = profileImage.bounds.width / 2
    }

    private func setUpUI() {
        guard let employee = employee else {
            return
        }
        profileImage.hero.id = HeroIdCreator.employeeImage(id: employee.id).id
        profileImage.image = UIImage(named: employee.imageName)
        nameLabel.hero.id = HeroIdCreator.employeeName(id: employee.id).id
        nameLabel.text = "Name: \(employee.name)"
        lastNameLabel.hero.id = HeroIdCreator.employeeLastName(id: employee.id).id
        lastNameLabel.text = "Last Name: \(employee.lastName)"
        roleLabel.hero.id = HeroIdCreator.employeeRole(id: employee.id).id
        roleLabel.text = "Role: \(employee.role)"
    }
}
