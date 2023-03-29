//
//  ViewController.swift
//  DigiProTechnicalTest
//
//  Created by Américo MQ on 28/03/23.
//

import UIKit
import SwiftUI

class MainViewController: UIViewController {
    
    private let manager = MainVerifications()
    private let managerCoreData = CoreDataManager()
    let swiftUIVC = UIHostingController(rootView: InfoListView())
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupScrollView()
        setupViews()
        setupKeyboard()
        
        nameTextField.delegate = self
        firstLastNameTextField.delegate = self
        secondLastNameTextField.delegate = self
        mailTextField.delegate = self
        phoneTextField.delegate = self
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        resetForm()
    }
    
    let errorLabel: UILabel = {
        let errLbl = UILabel()
        errLbl.translatesAutoresizingMaskIntoConstraints = false
        errLbl.text = "Algunos campos están erroneos"
        errLbl.textColor = .red
        errLbl.isHidden = true
        return errLbl
    }()
    
    let nameTextField: UITextField = {
        let nameTF = UITextField()
        nameTF.translatesAutoresizingMaskIntoConstraints = false
        nameTF.placeholder = "Escribe tu nombre"
        nameTF.textAlignment = .center
        nameTF.layer.borderColor = UIColor.darkGray.cgColor
        nameTF.layer.borderWidth = 1.0
        return nameTF
    }()
    
    let firstLastNameTextField: UITextField = {
        let firstLastNameTF = UITextField()
        firstLastNameTF.translatesAutoresizingMaskIntoConstraints = false
        firstLastNameTF.placeholder = "Escribe tu apellido Paterno"
        firstLastNameTF.textAlignment = .center
        firstLastNameTF.layer.borderColor = UIColor.darkGray.cgColor
        firstLastNameTF.layer.borderWidth = 1.0
        return firstLastNameTF
    }()
    
    let secondLastNameTextField: UITextField = {
        let secondLastNameTF = UITextField()
        secondLastNameTF.translatesAutoresizingMaskIntoConstraints = false
        secondLastNameTF.placeholder = "Escribe tu Apellido Materno"
        secondLastNameTF.textAlignment = .center
        secondLastNameTF.layer.borderColor = UIColor.darkGray.cgColor
        secondLastNameTF.layer.borderWidth = 1.0
        return secondLastNameTF
    }()
    
    let mailTextField: UITextField = {
        let mailTF = UITextField()
        mailTF.translatesAutoresizingMaskIntoConstraints = false
        mailTF.placeholder = "Escribe tu Email"
        mailTF.textAlignment = .center
        mailTF.layer.borderColor = UIColor.darkGray.cgColor
        mailTF.layer.borderWidth = 1.0
        return mailTF
    }()
    
    let phoneTextField: UITextField = {
        let phoneTF = UITextField()
        phoneTF.translatesAutoresizingMaskIntoConstraints = false
        phoneTF.placeholder = "Digita tu número Celular"
        phoneTF.keyboardType = .phonePad
        phoneTF.textAlignment = .center
        phoneTF.layer.borderColor = UIColor.darkGray.cgColor
        phoneTF.layer.borderWidth = 1.0
        return phoneTF
    }()
    
    let horizontalStack: UIStackView = {
        let hStack = UIStackView()
        hStack.translatesAutoresizingMaskIntoConstraints = false
        hStack.axis = .horizontal
        hStack.distribution = .fillEqually
        hStack.spacing = 10
        return hStack
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.alpha = 0.5
        button.setTitle("Registrar", for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.isEnabled = false
        button.addTarget(self, action: #selector(saveUserInfo), for: .touchUpInside)
        return button
    }()
    
    lazy var showInfoButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitle("Lista de usuarios", for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(showList), for: .touchUpInside)
        return button
    }()
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }
    
    private func setupViews() {
        
        contentView.addSubview(errorLabel)
        contentView.addSubview(nameTextField)
        contentView.addSubview(firstLastNameTextField)
        contentView.addSubview(secondLastNameTextField)
        contentView.addSubview(mailTextField)
        contentView.addSubview(phoneTextField)
        contentView.addSubview(horizontalStack)
        
        horizontalStack.addArrangedSubview(registerButton)
        horizontalStack.addArrangedSubview(showInfoButton)
        
        NSLayoutConstraint.activate([
            errorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            errorLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            errorLabel.heightAnchor.constraint(equalToConstant: 30),
            errorLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            nameTextField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            nameTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            nameTextField.heightAnchor.constraint(equalToConstant: 30),
            nameTextField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            firstLastNameTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 30),
            firstLastNameTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            firstLastNameTextField.heightAnchor.constraint(equalToConstant: 30),
            firstLastNameTextField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            secondLastNameTextField.topAnchor.constraint(equalTo: firstLastNameTextField.bottomAnchor, constant: 30),
            secondLastNameTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            secondLastNameTextField.heightAnchor.constraint(equalToConstant: 30),
            secondLastNameTextField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            mailTextField.topAnchor.constraint(equalTo: secondLastNameTextField.bottomAnchor, constant: 30),
            mailTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            mailTextField.heightAnchor.constraint(equalToConstant: 30),
            mailTextField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            phoneTextField.topAnchor.constraint(equalTo: mailTextField.bottomAnchor, constant: 30),
            phoneTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            phoneTextField.heightAnchor.constraint(equalToConstant: 30),
            phoneTextField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            horizontalStack.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: 30),
            horizontalStack.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            horizontalStack.heightAnchor.constraint(equalToConstant: 30),
            horizontalStack.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            horizontalStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            
        ])
    }
    
    @objc func showList() {
        self.navigationController?.pushViewController(swiftUIVC, animated: true)
    }
    
    @objc func saveUserInfo() {
        registerButton.bounce()
        if let name = nameTextField.text, let lastName = firstLastNameTextField.text, let secondLastName = secondLastNameTextField.text, let mail = mailTextField.text, let phone = Int64(phoneTextField.text!) {
            managerCoreData.saveUserInfo(name: name, firstLastName: lastName, secondLastName: secondLastName, email: mail, phone: phone)
            self.navigationController?.pushViewController(swiftUIVC, animated: true)
        }
    }
}

extension MainViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = textField.text {
            if textField == mailTextField {
                if !manager.isValidEmail(email: text) {
                    errorLabel.isHidden = false
                    textField.layer.borderColor = UIColor.red.cgColor
                } else {
                    textField.layer.borderColor = UIColor.darkGray.cgColor
                }
                
            } else {
                if manager.validateTextField(text: text) {
                    errorLabel.isHidden = true
                    textField.layer.borderColor = UIColor.darkGray.cgColor
                } else {
                    errorLabel.isHidden = false
                    textField.layer.borderColor = UIColor.red.cgColor
                }
            }
            
        }
        checkForm()
    }
}

extension MainViewController {
    func checkForm() {
        if let mail = mailTextField.text {
            if errorLabel.isHidden && manager.isValidEmail(email: mail) && !nameTextField.text!.isEmpty, !firstLastNameTextField.text!.isEmpty,
               !secondLastNameTextField.text!.isEmpty, !phoneTextField.text!.isEmpty {
                registerButton.isEnabled = true
                registerButton.alpha = 1.0
            } else {
                registerButton.isEnabled = false
                registerButton.alpha = 0.5
            }
        }
        
    }
    
    func resetForm() {
        nameTextField.text = ""
        nameTextField.layer.borderColor = UIColor.darkGray.cgColor
        
        firstLastNameTextField.text = ""
        firstLastNameTextField.layer.borderColor = UIColor.darkGray.cgColor
        
        secondLastNameTextField.text = ""
        secondLastNameTextField.layer.borderColor = UIColor.darkGray.cgColor
        
        mailTextField.text = ""
        mailTextField.layer.borderColor = UIColor.darkGray.cgColor
        
        phoneTextField.text = ""
        phoneTextField.layer.borderColor = UIColor.darkGray.cgColor
        
        errorLabel.isHidden = true
    }
    
    private func setupKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(sender: NSNotification) {
        if UIDevice.current.orientation == UIDeviceOrientation.landscapeRight {
            view.frame.origin.y = view.frame.origin.y - 200
        } else if UIDevice.current.orientation == UIDeviceOrientation.landscapeLeft {
            view.frame.origin.y = view.frame.origin.y - 200
        }
        
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        view.frame.origin.y = 0
    }
}

