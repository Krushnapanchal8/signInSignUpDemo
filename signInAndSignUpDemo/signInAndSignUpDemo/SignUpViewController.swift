//
//  SignUpViewController.swift
//  signInAndSignUpDemo
//
//  Created by Mac on 30/01/23.
//

import UIKit

class SignUpViewController: UIViewController {

 
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var conPassError: UILabel!
    @IBOutlet weak var conPassTF: UITextField!
    @IBOutlet weak var passwordError: UILabel!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var emailError: UILabel!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var nameError: UILabel!
    @IBOutlet weak var nameTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        resetForm()
    }
    
    func resetForm() {
        signUpBtn.isEnabled = false
        
        emailError.isHidden = false
        passwordError.isHidden = false
        
        emailError.text = "Required"
        passwordError.text = "Required"
        
        emailTF.text = ""
        passwordTF.text = ""
    }
    
    
    
    @IBAction func nameChanged(_ sender: Any) {
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
    
    @IBAction func passwordChanged(_ sender: Any) {
        if let password = passwordTF.text
        {
            if let errorMessage = invalidPassword(password)
            {
                passwordError.text = errorMessage
                passwordError.isHidden = false
            }
            else
            {
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
    
    
    @IBAction func conPassChanged(_ sender: Any) {
    }
    
    @IBAction func alreadyHaveAccBtnClick(_ sender: UIButton) {
        let signInVC1 = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(signInVC1, animated: true)
    }
    @IBAction func signUpClick(_ sender: UIButton) {
        let signInVC = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(signInVC, animated: true)
        resetForm()
    }
    
    
   func checkForValidForm() {
       if emailError.isHidden && passwordError.isHidden
       {
           signUpBtn.isEnabled = true
       }
       else
       {
           signUpBtn.isEnabled = false
       }
    }
}
