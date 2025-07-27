//
//  SearchVC.swift
//  GHFollowers
//
//  Created by Usanka Ranasinghe on 27/7/2025.
//

import UIKit

class SearchVC: UIViewController {
    let logoImageView = UIImageView()
    let usernameTextField = GFTextField()
    let callToActionButton = GFButton(backgroundColor: .systemGreen,
                                      title: "Get Followers")
    
    var isUsernameEntered: Bool {
        !(usernameTextField.text?.isEmpty ?? true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        createDismissKeyboardTapGesture()
        
        configureLogoImageView()
        configureTextField()
        configureCallToActionButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(
            target: view,
            action: #selector(view.endEditing)
        )
        view.addGestureRecognizer(tap)
    }
    
    @objc func pushFollowersVC() {
        guard isUsernameEntered else {
            presentGFAlertOnMainThread(
                title: "Empty username",
                message: "Please enter a username. We need to know who to look up 😀",
                buttonTitle: "Ok"
            )
            return
        }
        
        let followersVC = FollowerListVC()
        followersVC.username = usernameTextField.text!
        followersVC.title = usernameTextField.text
        navigationController?.pushViewController(followersVC, animated: true)
    }
    
    func configureLogoImageView() {
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "gh-logo")!
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 80
            ),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 200),
            logoImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func configureTextField() {
        view.addSubview(usernameTextField)
        usernameTextField.delegate = self
        
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(
                equalTo: logoImageView.bottomAnchor,
                constant: 48
            ),
            usernameTextField.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 50
            ),
            usernameTextField.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -50
            ),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configureCallToActionButton() {
        view.addSubview(callToActionButton)
        callToActionButton.addTarget(
            self,
            action: #selector(pushFollowersVC),
            for: .touchUpInside
        )
        
        NSLayoutConstraint.activate([
            callToActionButton.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                constant: -50
            ),
            callToActionButton.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 50
            ),
            callToActionButton.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -50
            ),
            callToActionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

// MARK: - UITextFieldDelegate

extension SearchVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}
