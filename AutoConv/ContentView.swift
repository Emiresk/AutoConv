//
//  ContentView.swift
//  AutoConv
//
//  Created by Vitaliy on 29.12.2022.
//

import SwiftUI

struct ContentView: View
{
    var body: some View
    {
        TabView {
            DistanceView()
                .tabItem{
                    Image (systemName: "location.fill")
                    Text ("Distance")
                }
            
            GasSpendView()
                .tabItem
                {
                    Image ( systemName: "speedometer")
                    Text ("Fuel Consumption")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
