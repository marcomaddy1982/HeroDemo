//
//  StringExtensions.swift
//  HeroDemo
//
//  Created by Marco Maddalena on 02.12.18.
//  Copyright © 2018 Intive. All rights reserved.
//

import Foundation

extension String {
    /// Static helper var of empty string
    static var empty: String {
        return ""
    }

    /// helper variable that converts first letter to uppercase
    var firstUppercased: String {
        guard let first = first else {
            return .empty
        }
        return String(first).uppercased() + dropFirst()
    }
}
