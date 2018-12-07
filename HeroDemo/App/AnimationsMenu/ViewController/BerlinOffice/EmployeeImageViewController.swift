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

    private var employee: Employee = Employee()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }

    private func setUpUI() {
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
            /**
             Dismiss the current view controller with animation. Will perform a navigationController.popViewController
             if the current view controller is contained inside a navigationController
             */
            hero.dismissViewController()
        case .changed:
            /**
             Update the progress for the interactive transition.
             */
            Hero.shared.update(progress)
            let xCurrentPosition = translation.x + profileImage.center.x
            let yCurrentPosition = translation.y + profileImage.center.y
            let currentPosition = CGPoint(x: xCurrentPosition, y: yCurrentPosition)
            /**
             Override modifiers during an interactive animation.
             will set the view's position to "currentPosition"
             */
            Hero.shared.apply(modifiers: [.position(currentPosition)], to: profileImage)
        default:
            if progress + sender.velocity(in: nil).y / profileImage.bounds.height > 0.1 {
                /**
                 Finish the interactive transition.
                 Will stop the interactive transition and animate from the
                 current state to the **end** state
                 */
                Hero.shared.finish()
            } else {
                /**
                 Cancel the interactive transition.
                 Will stop the interactive transition and animate from the
                 current state to the **beginning** state
                 */
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

extension EmployeeImageViewController {
    static func create(with employee: Employee) -> EmployeeImageViewController {
        guard let employeeImageViewController: EmployeeImageViewController =
            UIStoryboard.create(viewController: .employeeImage) else {
                return EmployeeImageViewController()
        }
        employeeImageViewController.employee = employee
        return employeeImageViewController
    }
}
