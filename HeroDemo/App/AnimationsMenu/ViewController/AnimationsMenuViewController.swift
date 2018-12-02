//
//  AnimationsMenuViewController.swift
//  HeroDemo
//
//  Created by Marco Maddalena on 02.12.18.
//  Copyright © 2018 Intive. All rights reserved.
//

import UIKit

protocol AnimationsMenuDelegate: AnyObject {
    func perform(action: AnimationsMenuAction)
}

enum AnimationsMenuAction {
    case showRegistrationFlow
    case showBerlinOffice
}

class AnimationsMenuViewController: UITableViewController {

    weak var delegate: AnimationsMenuDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Animations Menu"
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.perform(action: indexPath.row == 0 ? .showRegistrationFlow : .showBerlinOffice)
    }
}
