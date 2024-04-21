//
//  ContentView.swift
//  EnergyTrackerApp
//
//  Created by Melissa Breguez on 11/29/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var userData = UserData()
    @State var image: String = "energy"
    
    var body: some View {
        VStack {
            NavigationStack {
                NavigationLink(destination: DataEntryView(userData: userData)) {
                    Text("Enter Energy Usage")
                }.padding()
                
                NavigationLink(destination: UserDataView(userData: userData)) {
                    Text("View Energy Usage Data")
                    
                    .navigationTitle("Basic Self Energy Monitoring System")
                    .navigationBarTitleDisplayMode(.inline)
                }.padding()
                
                Image("energy")
                    .resizable()
                    .frame(width:400, height:350, alignment: .center)
                
            }
        }
    }
}

#Preview {
    ContentView(image: "image")
}
