//
//  HealthKitHandler.swift
//  HealthLeaderboard
//
//  Created by Vebby Clarissa on 19/09/19.
//  Copyright © 2019 Personal. All rights reserved.
//

import Foundation
import HealthKit

public class HealthKitHandler {
    private let healthStore = HKHealthStore()
    
    public func requestPermission () {
        ///Only request permission if it needed
        ///This function handle show the app asking for permission to read and share energy burned, cycling distance, walking or running distance, and heart rate samples.
        let allTypes = Set([HKObjectType.quantityType(forIdentifier: .activeEnergyBurned)!,
                            HKObjectType.quantityType(forIdentifier: .stepCount)!])
        
        //toShare:nil kalo cuma pengen nge read data doang. Kalo pengen ngubah jg tinggal ganti jd allTypes
        healthStore.requestAuthorization(toShare: allTypes, read: allTypes) { (success, error) in
            if !success {
                // Handle the error here.
                fatalError("Your arenot allowed to the health data")
            } else {
                print ("Success")
            }
        }
    }
    
    func getStepCountData() {
        //sample type
        guard let sampleType = HKSampleType.quantityType(forIdentifier: .stepCount) else {return}
        //limit
        let limit = HKObjectQueryNoLimit
        //predicate
        let predicate = setPredicate()
        
        let sampleQuery = HKSampleQuery(sampleType: sampleType, predicate: predicate, limit: limit, sortDescriptors: nil) { (sampleQuery, results, error) in
            guard let samples = results as? [HKQuantitySample] else {return}
            DispatchQueue.main.async {
                for sample in samples {
                    let startTime = sample.startDate
                    let steps = sample.quantity.doubleValue(for: .count())
                    print ("step \(steps) , \(startTime)")
                }
            }
        }
        healthStore.execute(sampleQuery)
    }
    
    func getActiveEnergyData() {
        //sample type
        guard let sampleType = HKSampleType.quantityType(forIdentifier: .activeEnergyBurned) else {return}
        //limit
        let limit = HKObjectQueryNoLimit
        //predicate
        let predicate = setPredicate()
        
        let sampleQuery = HKSampleQuery(sampleType: sampleType, predicate: predicate, limit: limit, sortDescriptors: nil) { (query, results, error) in
            if results as? [HKQuantitySample] == nil {
                print ("nil value")
            }
            guard let samples = results as? [HKQuantitySample] else {return}
            DispatchQueue.main.async {
                for sample in samples {
                    let caloriesValue = sample.quantity.doubleValue(for: .kilocalorie())
                    print (caloriesValue)
                }
            }
        }
        healthStore.execute(sampleQuery)
    }
    
    func setPredicate() -> NSPredicate{
//        let yesterday = Date.yesterday
        let today = Date()
        let predicate = HKQuery.predicateForSamples(withStart: today, end: today, options: .strictStartDate)
        
        return predicate
    }
}
