//
//  ViewController.swift
//  signInAndSignUpDemo
//
//  Created by Mac on 30/01/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var signInBtn: UIButton!
    @IBOutlet weak var passwordError: UILabel!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var emailError: UILabel!
    @IBOutlet weak var emailTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resetForm()
    }
    
    func resetForm() {
        signInBtn.isEnabled = false
        
        emailError.isHidden = false
        passwordError.isHidden = false
        
        emailError.text = "Required"
        passwordError.text = "Required"
        
        emailTF.text = ""
        passwordTF.text = ""
    }
    
    
    @IBAction func passwordChanged(_ sender: Any) {
        if let password = passwordTF.text
        {
            if let errorMessage = invalidPassword(password)
            {
                passwordError.text = errorMessage
                passwordError.isHidden = false
            }
            else {
                passwordError.isHidden = true
            }
        }
        checkForValidForm()
    }
    
    
    func invalidPassword(_ value: String) -> String?
    {
        if value.count < 8
        {
            return "Password must be at least 8 characters"
        }
        if containsDigit(value)
        {
            return "Password must contain at least 1 digit"
        }
        if containsLowerCase(value)
        {
            return "Password must contain at least 1 lowercase character"
        }
        if containsUpperCase(value)
        {
            return "Password must contain at least 1 uppercase character"
        }
        return nil
    }
    
    func containsDigit(_ value: String) -> Bool {
        let regularExpression = ".*[0-9]+.*"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        return !predicate.evaluate(with: value)
    }
    
    func containsLowerCase(_ value: String) -> Bool {
        let regularExpression = ".*[a-z]+.*"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        return !predicate.evaluate(with: value)
    }
    
    func containsUpperCase(_ value: String) -> Bool {
        let regularExpression = ".*[A-Z]+.*"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        return !predicate.evaluate(with: value)
    }
    
    @IBAction func emailChanged(_ sender: Any) {
        if let email = emailTF.text
        {
            if let errorMessage = invalidEmail(email)
            {
                emailError.text = errorMessage
                emailError.isHidden = false
            }
            else {
                emailError.isHidden = true
            }
        }
        checkForValidForm()
    }
    
    func invalidEmail(_ value: String) -> String?
    {
        let regularExpression = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        if !predicate.evaluate(with: value)
        {
            return "Invalid Email Address"
        }
        return nil
    }
    
    @IBAction func signInClick(_ sender: UIButton) {
        let homeVC = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        navigationController?.pushViewController(homeVC, animated: true)
        resetForm()
    }
    
    @IBAction func forgetPassClick(_ sender: UIButton) {
    }
    
    @IBAction func fbClick(_ sender: UIButton) {
    }
    
    @IBAction func googleClick(_ sender: UIButton) {
    }
    @IBAction func dontHavAccClick(_ sender: UIButton) {
        let signUpVC = storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    func checkForValidForm() {
        if emailError.isHidden && passwordError.isHidden
        {
            signInBtn.isEnabled = true
        }
        else
        {
            signInBtn.isEnabled = false
        }
    }
    
}
















// @IBAction func phoneChanged(_ sender: Any)
//{
//    if let phoneNumber = phoneTF.text
//    {
//        if let errorMessage = invalidPhoneNumber(phoneNumber)
//        {
//            phoneError.text = errorMessage
//            phoneError.isHidden = false
//        }
//        else {
//            phoneError.isHidden = true
//        }
//    }
//    checkForValidForm()
//}

//func invalidPhoneNumber(_ value: String) -> String?
//{
//    let set = CharacterSet(charactersIn: value)
//    if !CharacterSet.decimalDigits.isSuperset(of: set)
//    {
//        return "Phone Number must contain only digits"
//    }
//    if value.count != 10
//    {
//        return "Phone Number must be 10 Digits in length"
//    }
//    return nil
//}
