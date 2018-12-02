//
//  EmployeeGridCell.swift
//  HeroDemo
//
//  Created by Marco Maddalena on 02.12.18.
//  Copyright © 2018 Intive. All rights reserved.
//

import UIKit

class EmployeeGridViewCell: UICollectionViewCell {

    @IBOutlet private weak var profileImage: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var roleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        hero.modifiers = [.fade, .translate(y: 20)]
        profileImage.hero.modifiers = [.arc()]
    }

    func update(with employee: Employee) {
        profileImage.hero.id = HeroIdCreator.employeeImage(id: employee.id).id
        profileImage.image = UIImage(named: employee.imageName)
        nameLabel.text = "\(employee.name) \(employee.lastName)"
        roleLabel.text = employee.role
    }
}
