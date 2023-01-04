//
//  DistanceView.swift
//  AutoConv
//
//  Created by Vitaliy on 04.01.2023.
//

import SwiftUI

struct DistanceView: View {
    
    //Float
    @State private var _miles = 0.0
    @State private var _km = 0.0
    
    //String
    @State private var _milesStr = ""
    
    @State private var showResult = false
    
    let multi: Double = 1.609
    
    var body: some View
    {
        ZStack
        {
            Color.gray.opacity(0.15).ignoresSafeArea()
                
            VStack ()
            {
                Text("Distance Converter")
                    .fontWeight(.ultraLight)
                    .foregroundColor(Color.black)
                    .font(.system(size: 30))
                
            }
            .padding( .top, -275)
            
            VStack(alignment: .center)
            {
                TextField ("Set miles", text: $_milesStr )
                    .fontWeight( .light)
                    .font(.system(size: 24))
                    .cornerRadius( 15 )
                    .keyboardType(.decimalPad)
                    .onChange(of: _milesStr ){ input in
                        
                        showResult = false
                        
                        var flMil = ( input as NSString).doubleValue
                        
                        _km = (flMil * multi)
                        
                        if _km > 0.0
                        {
                            showResult = true
                        }
                    }
            }
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.black, lineWidth: 2))
            .padding(55)
            
            VStack
            {
                if showResult
                {
                    Text( String (format: "%0.1f", _km) + " km" )
                        .fontWeight(.heavy)
                        .foregroundColor(Color.black)
                        .font(.system(size: 35))
                        .multilineTextAlignment(.center)
                        .lineLimit(1)
                        .padding( .top, 275)
                        .padding( .horizontal, 35)
                }
            }
        }
    }
}
