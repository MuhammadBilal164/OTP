//
//  VerificationViewController.swift
//  UIDesignTaskStackView
//
//  Created by Umer Farooq on 29/09/2020.
//  Copyright © 2020 Umer Farooq. All rights reserved.
//

import UIKit

class VerificationViewController: UIViewController {
    
    
    //MARK: - IBOutlets
    @IBOutlet weak var forthCodeTextField: UITextField!
    @IBOutlet weak var thirdCodeTextField: UITextField!
    @IBOutlet weak var secondCodeTextField: UITextField!
    @IBOutlet weak var firstCodeTextField: UITextField!
    @IBOutlet weak var resendBtnTapped: UIButton!
    
    
   
   //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSetup()
    }
    
    
    //MARK: - Setupview
    func viewSetup() {
        
        forthCodeTextField.layer.cornerRadius = 12.0
        forthCodeTextField.layer.borderWidth = 1.0
        forthCodeTextField.layer.borderColor = UIColor.darkGray.cgColor
        
        thirdCodeTextField.layer.cornerRadius = 12.0
        thirdCodeTextField.layer.borderWidth = 1.0
        thirdCodeTextField.layer.borderColor = UIColor.darkGray.cgColor
        
        secondCodeTextField.layer.cornerRadius = 12.0
        secondCodeTextField.layer.borderWidth = 1.0
        secondCodeTextField.layer.borderColor = UIColor.darkGray.cgColor
        
        firstCodeTextField.layer.cornerRadius = 12.0
        firstCodeTextField.layer.borderWidth = 1.0
        firstCodeTextField.layer.borderColor = UIColor.darkGray.cgColor
        
        firstCodeTextField.delegate = self
        secondCodeTextField.delegate = self
        thirdCodeTextField.delegate = self
        forthCodeTextField.delegate = self
        
        firstCodeTextField.isEnabled = true
        firstCodeTextField.becomeFirstResponder()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        resendBtnTapped.isEnabled = false
    }
    
    
    //MARK: - Helper Methods And Objc
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}


//MARK: - UITextField Delegates
extension VerificationViewController:UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.blue.cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.darkGray.cgColor
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if ((textField.text!.count) < 1) && (string.count > 0) {
            
            if textField == firstCodeTextField {
                secondCodeTextField.isEnabled = true
                secondCodeTextField.becomeFirstResponder()
            }
            if textField == secondCodeTextField {
                thirdCodeTextField.isEnabled = true
                thirdCodeTextField.becomeFirstResponder()
            }
            if textField == thirdCodeTextField {
                forthCodeTextField.isEnabled = true
                forthCodeTextField.becomeFirstResponder()
                resendBtnTapped.isEnabled = true
            }
            textField.text = string
            return false
        }
            
        else if ((textField.text?.count)! >= 1 && (string.count == 0)) {
            
            if textField == secondCodeTextField {
                firstCodeTextField.becomeFirstResponder()
                resendBtnTapped.isEnabled = true
            }
            if textField == thirdCodeTextField {
                secondCodeTextField.becomeFirstResponder()
            }
            if textField == forthCodeTextField {
                thirdCodeTextField.becomeFirstResponder()
            }
            textField.text = ""
            
            return false
        }
            
        else if (textField.text?.count)! >= 1 {
            textField.text = string
            return false
        }
        
        return true
    }
}
