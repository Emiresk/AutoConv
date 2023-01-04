//
//  GasSpendView.swift
//  AutoConv
//
//  Created by Vitaliy on 04.01.2023.
//

import SwiftUI

struct GasSpendView: View {
    
    @State private var mpg = 0.0
    @State private var lpk = 0.0
    
    @State private var _mpgStr = ""
    @State private var _result = ""
    
    @State private var _color: Color = Color.black
    
    @State private var showResult = false
    
    let koef: Double = 235.214583
    
    var body: some View {
        
    ZStack
    {
        Color.gray.opacity(0.1).ignoresSafeArea()
        
        VStack ()
        {
            Text("Fuel Consumption Converter")
                .fontWeight(.ultraLight)
                .foregroundColor(Color.black)
                .font(.system(size: 30))
            
        }
        .padding( .top, -275)
        
        
        VStack
        {
            
            TextField ("Set MPG", text: $_mpgStr )
                .fontWeight( .light)
                .font(.system(size: 24))
                .cornerRadius( 15 )
                .keyboardType(.decimalPad)
                .onChange(of: _mpgStr ){ input in
                    showResult = false
                    
                    mpg = ( _mpgStr as NSString).doubleValue
                    
                    lpk = (koef / mpg)
                    
                    switch lpk
                    {
                        case 0...6:
                            _result = "Amazing result 😍"
                            _color = Color.green
                            
                        case 6...8:
                            _result = "Result is normal 😏"
                            _color = Color.mint
                            
                        case 8...11:
                            _result = "Gold Standard 😎"
                        _color = Color.indigo
                        
                        case 11...14:
                            _result = "Is stil normal...😔"
                            _color = Color.orange
                        
                        case 14...:
                            _result = "Fuck... Bad result"
                            _color = Color.red
                        
                        default:
                            _result = "May be you set MPG? 😎"
                            _color = Color.black
                    }
                    
                    if !_mpgStr.isEmpty && lpk > 0
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
                Text( String (format: "%0.1f", lpk) + " L/100Km" )
                    .fontWeight(.heavy)
                    .foregroundColor(Color.black)
                    .font(.system(size: 35))
                    .multilineTextAlignment(.center)
                    .lineLimit(1)
                    .padding( .top, 275)
                    .padding( .horizontal, 35)
                
                Text( _result )
                    .fontWeight(.regular)
                    .foregroundColor (_color )
                    .font(.system(size: 30))
                    .multilineTextAlignment(.center)
                    .lineLimit(1)
                    .padding( .top, 25)
                    .padding( .horizontal, 35)
            }
             
        }
        
    }
    }
}
