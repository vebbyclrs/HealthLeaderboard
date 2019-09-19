//
//  ViewController.swift
//  HealthKitActivity
//
//  Created by Vebby Clarissa on 17/09/19.
//  Copyright © 2019 Personal. All rights reserved.
//

import UIKit
import HealthKit

class ViewController: UIViewController {
    
    let hkHandler = HealthKitHandler()
    
    @IBOutlet var userBanner: UIView!
    @IBOutlet var userImage: UIImageView!
    @IBOutlet var lbTable: UITableView!
    @IBOutlet var userRank: UILabel!
    @IBOutlet var userCalories: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if HKHealthStore.isHealthDataAvailable() {
            // Add code to use HealthKit here. Like process the data etc
            hkHandler.requestPermission()
            hkHandler.getStepCountData()
            hkHandler.getActiveEnergyData()
            setView()
        }
        // Do any additional setup after loading the view.
    }
    func setView () {
        setBanner()
    }
    func setBanner() {
        userBanner.giveShadow(x: 0, y: 5, opacity: 0.5, blur: 5, shadowColor: nil)
        userImage.circleFrame(borderColor: UIColor.white.cgColor, borderWidth: 4)
    }
}

//extension UIViewController : UITableViewDelegate, UITableViewDataSource{
//    
//    enum Section{
//        static let firstWinner = 0
//        static let secondWinner = 1
//        static let other = 2
//    }
//    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if section != Section.other {
//            return 1
//        } else {
//            <#code#>
//        }
//    }
//    
//    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//    
//    
//}



