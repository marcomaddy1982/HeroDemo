//
//  BerlinOfficeGridViewController.swift
//  HeroDemo
//
//  Created by Marco Maddalena on 02.12.18.
//  Copyright © 2018 Intive. All rights reserved.
//

import UIKit

protocol BerlinOfficeGridDelegate: AnyObject {
    func perform(action: BerlinOfficeGridAction)
}

enum BerlinOfficeGridAction {
    case showList(berlinOfficeGridVC: BerlinOfficeGridViewController)
}

class BerlinOfficeGridViewController: UICollectionViewController {

    var employees: [Employee]?
    weak var delegate: BerlinOfficeGridDelegate?

    @IBAction private func toListDidPress(_ sender: Any) {
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
}
