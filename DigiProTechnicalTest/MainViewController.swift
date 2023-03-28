//
//  ViewController.swift
//  DigiProTechnicalTest
//
//  Created by Américo MQ on 28/03/23.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLoginUI()
    }

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
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitle("Registrar", for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 10
//        button.addTarget(self, action: #selector(onLoginTouch), for: .touchUpInside)
        return button
    }()
    
    func setupLoginUI() {
        
        view.addSubview(nameTextField)
        view.addSubview(firstLastNameTextField)
        view.addSubview(secondLastNameTextField)
        view.addSubview(phoneTextField)
        view.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            nameTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            nameTextField.heightAnchor.constraint(equalToConstant: 30),
            nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            firstLastNameTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 30),
            firstLastNameTextField.widthAnchor.constraint(equalTo: nameTextField.widthAnchor),
            firstLastNameTextField.heightAnchor.constraint(equalTo: nameTextField.heightAnchor),
            firstLastNameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            secondLastNameTextField.topAnchor.constraint(equalTo: firstLastNameTextField.bottomAnchor, constant: 30),
            secondLastNameTextField.widthAnchor.constraint(equalTo: firstLastNameTextField.widthAnchor),
            secondLastNameTextField.heightAnchor.constraint(equalTo: firstLastNameTextField.heightAnchor),
            secondLastNameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            phoneTextField.topAnchor.constraint(equalTo: secondLastNameTextField.bottomAnchor, constant: 30),
            phoneTextField.widthAnchor.constraint(equalTo: secondLastNameTextField.widthAnchor),
            phoneTextField.heightAnchor.constraint(equalTo: secondLastNameTextField.heightAnchor),
            phoneTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            loginButton.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: 60),
            loginButton.widthAnchor.constraint(equalTo: phoneTextField.widthAnchor),
            loginButton.heightAnchor.constraint(equalTo: phoneTextField.heightAnchor),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

