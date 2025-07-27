//
//  UIViewController+Ext.swift
//  GHFollowers
//
//  Created by Usanka Ranasinghe on 27/7/2025.
//

import UIKit

extension UIViewController {
    func presentGFAlertOnMainThread(
        title: String,
        message: String,
        buttonTitle: String
    ) {
        DispatchQueue.main.async {
            let alertVC = GFAlerVC(
                title: title,
                message: message,
                buttonTitle: buttonTitle
            )
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
}
