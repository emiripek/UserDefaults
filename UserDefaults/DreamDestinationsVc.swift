//
//  ViewController.swift
//  UserDefaults
//
//  Created by Emirhan İpek on 31.01.2024.
//

import UIKit

class DreamDestinationsVc: UIViewController {

    // UI Elements
    let haveVisitedLabel: UILabel = {
        let label = UILabel()
        label.text = "Have you been to this place before?"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let haveVisitedSwitch: UISwitch = {
        let switchControl = UISwitch()
        switchControl.translatesAutoresizingMaskIntoConstraints = false
        return switchControl
    }()

    let visitCountLabel: UILabel = {
        let label = UILabel()
        label.text = "How many times have you visited this place?"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let visitCountTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter visit count"
        textField.keyboardType = .numberPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    let destinationNameLabel: UILabel = {
        let label = UILabel()
        label.text = "What is the name of the place you want to visit?"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let destinationNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter destination name"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    let saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadSavedData()
    }

    func setupUI() {
        view.backgroundColor = .white

        // Add UI Elements to the view
        view.addSubview(haveVisitedLabel)
        view.addSubview(haveVisitedSwitch)
        view.addSubview(visitCountLabel)
        view.addSubview(visitCountTextField)
        view.addSubview(destinationNameLabel)
        view.addSubview(destinationNameTextField)
        view.addSubview(saveButton)

        // Set up constraints
        NSLayoutConstraint.activate([
            haveVisitedLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            haveVisitedLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),

            haveVisitedSwitch.topAnchor.constraint(equalTo: haveVisitedLabel.bottomAnchor, constant: 8),
            haveVisitedSwitch.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),

            visitCountLabel.topAnchor.constraint(equalTo: haveVisitedSwitch.bottomAnchor, constant: 16),
            visitCountLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),

            visitCountTextField.topAnchor.constraint(equalTo: visitCountLabel.bottomAnchor, constant: 8),
            visitCountTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            visitCountTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            destinationNameLabel.topAnchor.constraint(equalTo: visitCountTextField.bottomAnchor, constant: 16),
            destinationNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),

            destinationNameTextField.topAnchor.constraint(equalTo: destinationNameLabel.bottomAnchor, constant: 8),
            destinationNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            destinationNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            saveButton.topAnchor.constraint(equalTo: destinationNameTextField.bottomAnchor, constant: 20),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.widthAnchor.constraint(equalToConstant: 100)
        ])

        // Add action for the Save button
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }

    @objc func saveButtonTapped() {
        // Save data to UserDefaults
        let haveVisited = haveVisitedSwitch.isOn
        let visitCount = Int(visitCountTextField.text ?? "0") ?? 0
        let destinationName = destinationNameTextField.text ?? ""

        let destinationData = [
            "haveVisited": haveVisited,
            "visitCount": visitCount,
            "destinationName": destinationName
        ] as [String : Any]

        UserDefaults.standard.set(destinationData, forKey: "dreamDestination")

        // Show success message or perform any additional actions
        print("Data saved successfully!")
    }

    func loadSavedData() {
        // Retrieve data from UserDefaults
        if let destinationData = UserDefaults.standard.dictionary(forKey: "dreamDestination"),
           let haveVisited = destinationData["haveVisited"] as? Bool,
           let visitCount = destinationData["visitCount"] as? Int,
           let destinationName = destinationData["destinationName"] as? String {

            // Update UI elements with retrieved data
            haveVisitedSwitch.isOn = haveVisited
            visitCountTextField.text = "\(visitCount)"
            destinationNameTextField.text = destinationName

            print("Data retrieved successfully!")
        }
    }
}
