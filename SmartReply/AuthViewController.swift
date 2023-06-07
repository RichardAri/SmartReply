//
//  AuthViewController.swift
//  SmartReply
//
//  Created by Richard Ari on 5/06/23.
//

import UIKit
import FirebaseAuth
import FirebaseAnalytics

class AuthViewController: UIViewController {
    
    @IBOutlet weak var emailTextField : UITextField!
    @IBOutlet weak var passwordTextField : UITextField!
    @IBOutlet weak var signUpButton : UIButton!
    @IBOutlet weak var loginButton : UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Autenticacion"
        
        Analytics.logEvent("InitScreen", parameters: ["mensaje":"integracion de firebase completa"])
    }
    
    @IBAction func singUpButtonAction(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password){
                (result, error) in
                
                if let result = result, error == nil{
                    self.navigationController?.pushViewController(HomeViewController(email:result.user.email!, provider: .basic), animated: true)
                }else{
                    let alertController = UIAlertController(title: "Error", message: "Se ha producido un error al registrarse", preferredStyle: .alert) ;alertController.addAction(UIAlertAction(title: "Aceptar", style:.default))
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
     }
    
    
     @IBAction func logInButtonAction(_ sender: Any) {
         
         if let email = emailTextField.text, let password = passwordTextField.text{
             
             Auth.auth().signIn(withEmail: email, password: password){
                 (result,error) in
                 
                 if let result = result, error == nil{
                     self.navigationController?.pushViewController(HomeViewController(email:result.user.email!, provider: .basic), animated: true)
                 }else{
                     let alertController = UIAlertController(title: "Error", message: "Se ha producido un error al ingresar", preferredStyle: .alert) ;alertController.addAction(UIAlertAction(title: "Aceptar", style:.default))
                     
                     self.present(alertController, animated: true, completion: nil)
                 }
             }
         }
     }

}

