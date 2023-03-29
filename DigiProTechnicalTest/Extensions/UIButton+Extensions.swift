//
//  UIButton+Extensions.swift
//  DigiProTechnicalTest
//
//  Created by Américo MQ on 29/03/23.
//

import Foundation
import UIKit

extension UIButton {
    func bounce() {
        UIView.animate(withDuration: 0.1, animations: {
            self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }) { (completion) in
            UIView.animate(withDuration: 0.1, animations: {
                self.transform = .identity
            })
        }
    }
}
