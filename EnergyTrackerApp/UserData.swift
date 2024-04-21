//
//  UserData.swift
//  EnergyTrackerApp
//
//  Created by Melissa Breguez on 11/29/23.
//

import Foundation
import CoreData

class UserData: ObservableObject {
    @Published var walkingMinutes: Double = 0.0
    @Published var runningMinutes: Double = 0.0
    @Published var foodIntake: Double = 0.0
    @Published var phoneTime: Double = 0.0
    @Published var washingMachineTime: Double = 0.0
    @Published var dishwasherTime: Double = 0.0
    
    @Published var totalWalkingTime: Double = 0.0
    @Published var totalRunningTime: Double = 0.0
    @Published var totalCaloriesLost: Double = 0.0
    @Published var totalPhoneTime: Double = 0.0
    @Published var totalWashingMachineTime: Double = 0.0
    @Published var totalDishwasherTime: Double = 0.0
    
    @Published var totalWalkCal: Double = 0.0
    @Published var totalRunCal: Double = 0.0
    
    @Published var foodWattsTotal: Double = 0.0
    @Published var exerciseWattsTotal: Double = 0.0
    @Published var phoneWattsTotal: Double = 0.0
    @Published var washingMachineWattsTotal: Double = 0.0
    @Published var dishwasherWattsTotal: Double = 0.0
    
    @Published var totalWatts: Double = 0.0
}

