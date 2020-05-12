//
//  ContentView.swift
//  unitConversion
//
//  Created by Jad El mir on 5/12/20.
//  Copyright © 2020 Jad El mir. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var temperatureFrom = 0
    @State private var temperatureTo = 1
    @State private var fromTmp = ""
    
    let Temperatures = ["Celcius","Fahrenheit","Kelvin"]
    var toTmp :Double {
//        standard is celcius
        var celcius:Double = 0.0
        var FinalAmount:Double = 0.0
        let amount = Double(fromTmp) ?? 0
        if temperatureFrom == 1 {
            celcius = (amount - 32 )*5 / 9
        }
        else if temperatureFrom == 2 {
            celcius =  amount - 273.15
        }
        else {celcius = amount}
        if temperatureTo == 1 {
            FinalAmount = (celcius / 5 ) * 9 + 32
        }
        else if temperatureTo == 2 {
            FinalAmount =  celcius + 273.15
        }
        else {FinalAmount = celcius}
        return FinalAmount
    }
    var body: some View {
        Form{
            Section(header:Text("Temperature")){
                TextField("Amount",text:$fromTmp )
                Picker("tem",selection: $temperatureFrom){
                    ForEach(0 ..< self.Temperatures.count){
                        Text("\(self.Temperatures[$0])")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header:Text("Temperature")){
                Picker("tem",selection: $temperatureTo){
                    ForEach(0 ..< self.Temperatures.count){
                        Text("\(self.Temperatures[$0])")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            Section{
                Text("\(toTmp)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
