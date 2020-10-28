//
//  loginController2.swift
//  RaxuApp
//
//  Created by Andrew Bergerson on 10/25/20.
//  Copyright © 2020 Raxu. All rights reserved.
//

import UIKit
import Firebase

class loginController2: UIViewController {
    
    var db: Firestore!
    var docRef: DocumentReference!
   
    @IBAction func username(_ sender: Any) {
    }
    @IBOutlet weak var usrnm: UITextField!
    @IBOutlet weak var pswrd: UITextField!
    @IBOutlet weak var warningText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        warningText.text = ""
        
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func singInClicked(_ sender: Any) {
        let username: String = usrnm.text!
        let password: String = pswrd.text!
        
        let specificUserRef = db.collection("users").whereField("username", isEqualTo: username)
        let query = specificUserRef.whereField("password", isEqualTo: password).getDocuments { (snapshot, error) in
            if let err = error{
                print("Error fetching the doc \(err)")
                self.warningText.text = "Invalid Credentials"
            }
            else{
                guard let moment = snapshot else {return}
                for field in moment.documents{
                    let info = field.data()
                    global_name = info["firstName"] as! String
                }
                global_uid = username
                
                self.performSegue(withIdentifier: "signinToHome", sender: self)
            }
        }
    }
    
    @IBAction func noAccountClicked(_ sender: Any) {
        performSegue(withIdentifier: "toCreateSegue", sender: self)
    }
}
