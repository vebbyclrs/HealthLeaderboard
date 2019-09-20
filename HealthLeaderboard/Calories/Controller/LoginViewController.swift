//
//  LoginViewController.swift
//  HealthLeaderboard
//
//  Created by Vebby Clarissa on 19/09/19.
//  Copyright © 2019 Personal. All rights reserved.
//

import UIKit
import LocalAuthentication
import HealthKit

class LoginViewController: UIViewController {
    let hkHandler = HealthKitHandler()
    override func viewDidLoad() {
        super.viewDidLoad()
        if HKHealthStore.isHealthDataAvailable() {
            hkHandler.requestPermission()
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func login(_ sender: Any) {
        let context = LAContext()
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "We need your face id to access the app") { (success, error) in
                if success {
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "move", sender: self)
                    }
                } else {
                    print ("Biometric did not success")
                }
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
