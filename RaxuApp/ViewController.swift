//
//  ViewController.swift
//  RaxuApp
//
//  Created by Andrew Bergerson on 10/13/20.
//  Copyright © 2020 Raxu. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift

public var global_uid: String?
public var global_name: String?

class ViewController: UIViewController {
    
    var db: Firestore!
    
    @IBOutlet weak var aqlabel: UILabel!
    
    @IBOutlet weak var uidbox: UITextField!
    
    @IBOutlet weak var pwordBox: UITextField!
    
    @IBOutlet weak var emailBox: UITextField!
    
    @IBOutlet weak var warningLabel: UILabel!
    
    @IBOutlet weak var firstNameField: UITextField!
    
    @IBAction func switchToSignIn(_ sender: Any) {
    }
    
    @IBAction func firstNameBox(_ sender: Any) {
    }
    
    @IBOutlet weak var switchToSignIn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
        
        warningLabel.text = ""
    }
    
    
    //register button
    @IBAction func saveclick(_ sender: UIButton) {
        
        let local_uid: String = uidbox.text!
        let userRef = db.collection("users")
        
        let query = userRef.whereField("username", isEqualTo: local_uid).getDocuments { (snapshot, error) in
            if let err = error{
                print("Error fetching the doc \(err)")
            }
            else{
                if snapshot?.count == 0{
                    global_uid = local_uid
                    global_name = self.firstNameField.text!
                    
                    let userDoc = userRef.document(local_uid)
                    let password: String = self.pwordBox.text!
                    let emailAddress: String = self.emailBox.text!
                    let dataToSave: [String: Any] = ["username":local_uid, "password":password, "firstName":global_name!, "email":emailAddress]
                    userDoc.setData(dataToSave)

                    self.performSegue(withIdentifier: "homePageSegue", sender: self)
                }
                else{
                    self.warningLabel.text = "Username is already in use"
                    self.uidbox.text = ""
                    self.pwordBox.text = ""
                }
            }
        }
    }
    
    @IBAction func toLogin(_ sender: UIButton) {
        self.performSegue(withIdentifier: "toLoginSegue", sender: self)
    }
}

