//
//  EmployeeImageViewController.swift
//  HeroDemo
//
//  Created by Marco Maddalena on 03.12.18.
//  Copyright © 2018 Intive. All rights reserved.
//

import UIKit
import Hero

class EmployeeImageViewController: UIViewController {

    @IBOutlet private weak var profileImage: UIImageView!

    var employee: Employee?

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }

    private func setUpUI() {
        guard let employee = employee else {
            return
        }
        profileImage.hero.id = HeroIdCreator.employeeImage(id: employee.id).id
        let xPosition = view.bounds.width / 2
        let yPosition = view.bounds.height + view.bounds.width / 2
        profileImage.hero.modifiers = [.position(CGPoint(x: xPosition, y: yPosition)),
                                       .scale(0.6),
                                       .fade]
        profileImage.image = UIImage(named: employee.imageName)
    }

    @IBAction private func pan(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: nil)
        let progress = translation.y / 2 / profileImage.bounds.height
        switch sender.state {
        case .began:
            hero.dismissViewController()
        case .changed:
            Hero.shared.update(progress)
            let xCurrentPosition = translation.x + profileImage.center.x
            let yCurrentPosition = translation.y + profileImage.center.y
            let currentPosition = CGPoint(x: xCurrentPosition, y: yCurrentPosition)
            Hero.shared.apply(modifiers: [.position(currentPosition)], to: profileImage)
        default:
            if progress + sender.velocity(in: nil).y / profileImage.bounds.height > 0.1 {
                Hero.shared.finish()
            } else {
                Hero.shared.cancel()
            }
        }
    }

    @IBAction private func toggleIsHeroDebugPluginEnabled(_ sender: UISwitch) {
        HeroDebugPlugin.isEnabled = sender.isOn
    }
}

extension EmployeeImageViewController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        guard let gestureRecognizer = gestureRecognizer as? UIPanGestureRecognizer else {
            return false
        }
        let v = gestureRecognizer.velocity(in: nil)
        return v.y > abs(v.x)
    }
}
