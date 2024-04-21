//
//  DataEntryView.swift
//  EnergyTrackerApp
//
//  Created by Melissa Breguez on 11/29/23.
//
/*
 logging walking, running, eating, phone time, 
 */
import Foundation
import SwiftUI

struct DataEntryView: View {
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var userData: UserData
    
    @State var walkingMinutesString: String = ""
    @State var runningMinutesString: String = ""
    @State var foodCaloriesString: String = ""
    @State var phoneTimeString: String = ""
    @State var washingMachineTimeString: String = ""
    @State var dishwasherTimeString: String = ""
    
    @State var foodIntake: Double = 0.0
    @State var walkingMinutes: Double = 0.0
    @State var runningMinutes: Double = 0.0
    @State var phoneTime: Double = 0.0
    @State var washingMachineTime: Double = 0.0
    @State var dishwasherTime: Double = 0.0
    
    @State var totalWalkingTime: Double = 0.0
    @State var totalRunningTime: Double = 0.0
    @State var totalPhoneTime: Double = 0.0
    @State var totalWashingMachineTime: Double = 0.0
    @State var totalDishwasherTime: Double = 0.0
    
    @State var totalWalkCal: Double = 0.0
    @State var totalRunCal: Double = 0.0
    
    @State var foodwatts: Double = 0.0
    @State var walkingWatts: Double = 0.0
    @State var runningWatts: Double = 0.0
    @State var phoneWatts: Double = 0.0
    @State var washingMachineWatts: Double = 0.0
    @State var dishwasherWatts: Double = 0.0
    
    @State var foodWattsTotal: Double = 0.0
    @State var exerciseWattsTotal: Double = 0.0
    @State var phoneWattsTotal: Double = 0.0
    @State var washingMachineWattsTotal: Double = 0.0
    @State var dishwasherWattsTotal: Double = 0.0
    
    @State var totalWatts: Double = 0.0
    
    func calcInfo(walkingMinutesString: String, runningMinutesString: String, foodCaloriesString: String, phoneTimeString: String, washingMachineTimeString: String, dishwasherTimeString: String) -> ( exerciseWattsTotal: Double, foodWattsTotal: Double, phoneWattsTotal: Double, washingMachineWattsTotal: Double, dishwasherWattsTotal: Double, totalWatts: Double) {
        
        walkingMinutes = Double(walkingMinutesString)!
        runningMinutes = Double(runningMinutesString)!
        foodIntake = Double(foodCaloriesString)!
        phoneTime = Double(phoneTimeString)!
        washingMachineTime = Double(washingMachineTimeString)!
        dishwasherTime = Double (dishwasherTimeString)!
        
        //return average calories for walking/running
        
        totalWalkingTime = totalWalkingTime + walkingMinutes
        totalWalkCal = (5 * walkingMinutes) + totalWalkCal
        
        //running time and calories
        totalRunningTime = totalRunningTime + walkingMinutes
        totalRunCal = (10 * runningMinutes) + totalRunCal
        
        //phone time
        totalPhoneTime = totalPhoneTime + phoneTime
        
        //washing machine time
        totalWashingMachineTime = totalWashingMachineTime + washingMachineTime
        
        //dishwasher time
        totalDishwasherTime = totalDishwasherTime + dishwasherTime
        
        //watts calculations
        exerciseWattsTotal = 0.001162 * (totalWalkCal + totalRunCal)
        
        foodWattsTotal = 0.001162 * foodIntake
        
        phoneWattsTotal = 5.45 * totalPhoneTime
        
        washingMachineWattsTotal = 600 * totalWashingMachineTime
        
        dishwasherWattsTotal = 2000 * totalDishwasherTime
        
        // total watts consumed - total watts produced
        totalWatts = foodWattsTotal + phoneWattsTotal + washingMachineWattsTotal + dishwasherWattsTotal - exerciseWattsTotal
        
        return (exerciseWattsTotal, foodWattsTotal, phoneWattsTotal, washingMachineWattsTotal, dishwasherWattsTotal, totalWatts)
        
    }
    
    func updateUserData() {
        let (exerciseWattsTotal, foodWattsTotal, phoneWattsTotal, washingMachineWattsTotal, dishwasherWattsTotal, totalWatts) = calcInfo(walkingMinutesString: walkingMinutesString, runningMinutesString: runningMinutesString, foodCaloriesString: foodCaloriesString, phoneTimeString: phoneTimeString, washingMachineTimeString: washingMachineTimeString, dishwasherTimeString: dishwasherTimeString)
        userData.exerciseWattsTotal = exerciseWattsTotal
        userData.foodWattsTotal = foodWattsTotal
        userData.phoneWattsTotal = phoneWattsTotal
        userData.washingMachineWattsTotal = washingMachineWattsTotal
        userData.dishwasherWattsTotal = dishwasherWattsTotal
        userData.totalWatts = totalWatts
    }
    
    func removeUserData() {
        userData.exerciseWattsTotal = 0.0
        userData.foodWattsTotal = 0.0
        userData.phoneWattsTotal = 0.0
        userData.washingMachineWattsTotal = 0.0
        userData.dishwasherWattsTotal = 0.0
        userData.totalWatts = 0.0
    }
    
    var body: some View {
        Text("Enter Data")
            .fontWeight(.bold)
        VStack {
            HStack {
                Text("Walking (in hours):")
                    .foregroundStyle(.blue)
                    .padding()
                TextField("Walking", text: $walkingMinutesString).padding()
            }
            
            HStack {
                Text("Running (in minutes):")
                    .foregroundStyle(.orange)
                    .padding()
                    
                TextField("Running", text: $runningMinutesString)
                    .padding()
            }
            
            HStack {
                Text("Food Intake (in calories):")
                    .foregroundStyle(.red)
                    .padding()
                TextField("Food Intake",text: $foodCaloriesString)
            }
            
            HStack {
                Text("Phone usage (in hours):")
                    .foregroundStyle(.purple)
                    .padding()
                TextField("Phone usage", text: $phoneTimeString)
            }
            
            HStack {
                Text("Washing Machine usage (in hours):")
                    .foregroundStyle(.green)
                    .padding()
                TextField("Washing Machine usage", text: $washingMachineTimeString)
            }
            
            HStack {
                Text("Dishwasher usage (in hours):")
                    .foregroundStyle(.cyan)
                    .padding()
                TextField("Dishwasher usage", text: $dishwasherTimeString)
            }
            
            Button("Add Data") {
                updateUserData()
            } .padding()
            
            Button("Clear Data (removes ALL DATA!!)") {
                removeUserData()
            }
        }
    }
}

#Preview {
    DataEntryView(userData: UserData())
}
