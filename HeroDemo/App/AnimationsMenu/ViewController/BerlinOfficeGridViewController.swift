//
//  BerlinOfficeGridViewController.swift
//  HeroDemo
//
//  Created by Marco Maddalena on 02.12.18.
//  Copyright © 2018 Intive. All rights reserved.
//

import UIKit
import Hero

protocol BerlinOfficeGridDelegate: AnyObject {
    func perform(action: BerlinOfficeGridAction)
}

enum BerlinOfficeGridAction {
    case showList(berlinOfficeGridVC: BerlinOfficeGridViewController)
    case showEmployeeImage(berlinOfficeGridVC: BerlinOfficeGridViewController, employee: Employee)
}

class BerlinOfficeGridViewController: UICollectionViewController {

    var employees: [Employee]?
    weak var delegate: BerlinOfficeGridDelegate?

    @IBAction private func toListButtonDidPress(_ sender: Any) {
        delegate?.perform(action: .showList(berlinOfficeGridVC: self))
    }

    //MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return employees?.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: "EmployeeGridViewCell", for: indexPath) as? EmployeeGridViewCell)!

        guard let employee = employees?[indexPath.row] else {
            return cell
        }
        cell.update(with: employee)
    
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let employee = employees?[indexPath.row] else {
            return
        }
        delegate?.perform(action: .showEmployeeImage(berlinOfficeGridVC: self, employee: employee))
    }
}

extension BerlinOfficeGridViewController: HeroViewControllerDelegate {
    func heroWillStartAnimatingTo(viewController: UIViewController) {
        collectionView.hero.modifiers = [.cascade]
    }

    func heroWillStartAnimatingFrom(viewController: UIViewController) {
        collectionView.hero.modifiers = [.cascade, .delay(0.2)]
    }
}
