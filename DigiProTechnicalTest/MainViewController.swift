//
//  ViewController.swift
//  DigiProTechnicalTest
//
//  Created by Américo MQ on 28/03/23.
//

import UIKit

class MainViewController: UIViewController {
    
    private let manager = MainVerifications()
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupScrollView()
        setupViews()
        
        nameTextField.delegate = self
        firstLastNameTextField.delegate = self
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
        mailTF.isSecureTextEntry = true
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
    
    let registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitle("Registrar", for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        //        button.addTarget(self, action: #selector(onLoginTouch), for: .touchUpInside)
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
        contentView.addSubview(registerButton)
        
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
            
            registerButton.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: 30),
            registerButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            registerButton.heightAnchor.constraint(equalToConstant: 30),
            registerButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            registerButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            
        ])
    }
    
   
}

extension MainViewController: UITextFieldDelegate {
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = textField.text {
            if manager.validateTextField(text: text) {
                print("OK")
                errorLabel.isHidden = true
                textField.layer.borderColor = UIColor.darkGray.cgColor
            } else {
                errorLabel.isHidden = false
                textField.layer.borderColor = UIColor.red.cgColor
            }
        }
    }
}

