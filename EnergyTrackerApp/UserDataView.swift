//
//  UserDataView.swift
//  EnergyTrackerApp
//
//  Created by Melissa Breguez on 11/29/23.
//

import Foundation
import SwiftUI

struct UserDataView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var userData: UserData
    
    var body: some View {
        VStack (alignment: .center) {
            Text("Energy Consumption")
                .font(.largeTitle .weight(.bold))
            Spacer()
            VStack (alignment: .leading){
                Text("Total Watts Consumed via:")
                    .font(.title2 .weight(.bold))
                
                Text("Food: \(userData.foodWattsTotal)")
                    .foregroundColor(.red)
                    .padding()
                Text("Phone Usage: \(userData.phoneWattsTotal)")
                    .foregroundColor(.purple)
                    .padding()
                Text("Washing Machine Usage: \(userData.washingMachineWattsTotal)")
                    .foregroundColor(.green)
                    .padding()
                Text("Dishwasher Usage: \(userData.dishwasherWattsTotal)")
                    .foregroundColor(.cyan)
                    .padding()
                
                
                Text("Total Watts Generated via:")
                    .font(.title2 .weight(.bold))
                    .padding()
                Text("Exercise (running & walking): \(userData.exerciseWattsTotal)")
                    .foregroundColor(.orange)
                    .padding()
                
            }
            Spacer()
            Text("Total Watts Consumed: \(userData.totalWatts)")
                .font(.title3.weight(.bold))
        }
    }
}

#Preview {
    UserDataView(userData: UserData())
}
/*
 exerciseWattsTotal: Double, foodWattsTotal: Double, phoneWattsTotal: Double, washingMachineWattsTotal: Double, dishwasherWattsTotal: Double, totalWatts: Double
 
 blue orange red purple green cyan
 */
