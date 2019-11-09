//
//  ProfileViewController.swift
//  Concentration
//
//  Created by Sirarpi on 11/8/19.
//  Copyright © 2019 Sirarpi. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    
    @IBOutlet weak var nameLabel: UILabel!
        
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var profileImage: UIImageView!
    
    var observation: NSKeyValueObservation!
    
    @IBAction func moreButton(_ sender: Any) {
        let ac = UIAlertController(title: "", message: "Log Out?", preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        ac.addAction(UIAlertAction(title: "Cancel ", style: .cancel, handler: nil))
        
        ac.addAction(UIAlertAction(title: "Log Out", style: .destructive, handler: { (notification) in
            NotificationCenter.default.post(name: .logOutSuccess, object: .none)
        }))
        self.present(ac, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.nameLabel.text
            = "Name: " + User.sharedUser.userName
        self.scoreLabel.text = "Score:" + String(User.sharedUser.score)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(logOut(note:)),
                                               name: .logOutSuccess,
                                               object: nil)
        
        observation = User.sharedUser.observe(\.score, options: [.new]) { [weak self] (user, change) in
            if let self = self, let newValue = change.newValue {
                print("Called \(user.score)")
                
                self.scoreLabel.text = "Score: " + String(newValue)

            }
        }
        self.navigationItem.setHidesBackButton(true, animated: false)
       
     
    }
    
    @objc func logOut(note: Notification){
        self.navigationController?.popToRootViewController(animated: true)
    }
    

}
