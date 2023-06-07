//
//  HomeViewController.swift
//  SmartReply
//
//  Created by Richard Ari on 5/06/23.
//

import UIKit
import FirebaseAuth

enum ProviderType:String{
    case basic
}

class HomeViewController: UIViewController {
    
    @IBOutlet weak var emailLabel : UILabel!
    @IBOutlet weak var providerLabel : UILabel!
    @IBOutlet weak var closeSessionLabel : UIButton!
    
    private let email:String
    private let provider:ProviderType
    
    init(email: String, provider: ProviderType) {
        self.email = email
        self.provider = provider
        super.init(nibName: "HomeViewController", bundle: nil)
    }
    
    required init(coder:NSCoder) {
        fatalError("init(coder:)no ha sido implementado")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title="inicio"
        
        emailLabel.text = email
        providerLabel.text = provider.rawValue
        
    }
    
    @IBAction func closeSessionButtonAction(_ sender: Any) {
        
        switch provider {
        case .basic:
            do{
                try Auth.auth().signOut()
                navigationController?.popViewController(animated: true)
            }catch{
                
            }
        }
        
     }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
