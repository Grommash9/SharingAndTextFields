import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    let loginField = UITextField()
    let passwordField = UITextField()
    var logininfo = String()
    var passwordinfo = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButtonCreate()
        loginFieldCreate()
        passwordFieldCreate()
        shareButton()
        
    }
    
    func loginButtonCreate () {
        let loginButton = UIButton()
        loginButton.setTitle("login", for: .normal)
        loginButton.frame = CGRect(x: 100, y: 500, width: 50, height: 50)
        self.view.addSubview(loginButton)
        loginButton.backgroundColor = UIColor.green
        loginButton.addTarget(self, action: #selector(sendInformation), for: .touchUpInside)
    }
    
    func shareButton () {
        let shareButton = UIButton()
        shareButton.setTitle("share", for: .normal)
        shareButton.setTitle("shared", for: .selected)
        shareButton.frame = CGRect(x: 100, y: 550, width: 50, height: 50)
        self.view.addSubview(shareButton)
        shareButton.backgroundColor = UIColor.orange
        shareButton.addTarget(self, action: #selector(ValidCheker), for: .touchUpInside)
    }
    
    
    func loginFieldCreate () {
        loginField.frame = CGRect(x: 100, y: 300, width: 200, height: 30)
        self.view.addSubview(loginField)
        loginField.placeholder = "login"
        loginField.borderStyle = UITextField.BorderStyle.roundedRect
        loginField.delegate = self
    }
    
    
    func passwordFieldCreate () {
        passwordField.frame = CGRect(x: 100, y: 350, width: 200, height: 30)
        self.view.addSubview(passwordField)
        passwordField.placeholder = "password"
        passwordField.borderStyle = UITextField.BorderStyle.roundedRect
        passwordField.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc func sendInformation () {
        if loginField.text?.count ?? 0 > 3, passwordField.text?.count ?? 0 > 3 {
            logininfo = loginField.text!
            print(self.logininfo)
            passwordinfo = passwordField.text!
            print(self.passwordinfo)
        } else {
            var alertLogin = UIAlertController(title: nil, message: "Please enter you data to login", preferredStyle: .alert)
            alertLogin.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
            self.present(alertLogin,animated: true, completion: nil)
        }
    }
    
    @objc func ValidCheker () {
        if loginField.text?.count ?? 0 > 3, passwordField.text?.count ?? 0 > 3 {
            logininfo = loginField.text!
            passwordinfo = passwordField.text!
            var sharecontroller = UIActivityViewController(activityItems: [loginField.text!, passwordField.text!], applicationActivities: nil)
            self.present(sharecontroller, animated: true, completion: nil)
            } else {
            var alertLogin = UIAlertController(title: nil, message: "Please enter you data to share", preferredStyle: .alert)
            alertLogin.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
            self.present(alertLogin,animated: true, completion: nil)
            }
        }
        
    
    
}


