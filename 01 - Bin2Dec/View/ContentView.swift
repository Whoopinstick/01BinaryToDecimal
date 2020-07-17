//
//  ContentView.swift
//  01 - Bin2Dec
//
//  Created by Kevin Paul on 7/16/20.
//  Copyright © 2020 Whoopinstick. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var binaryText: String = ""
    @State private var decimalValue: Int = 0
    @State private var isShowingAlert: Bool = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    var body: some View {
        NavigationView {
            Form {
                
                Section(header: Text("Instructions")) {
                    VStack(alignment: .center) {
                        Text("Enter an 8 digit or smaller binary number and click Calculate")
                    }
                }
                
                Section(header: Text("Binary Value")) {
                    TextField("00000000", text: $binaryText)
                        .keyboardType(.numberPad)
                }
                
                Section {
                    Button("Calculate") {
                        self.decimalValue = self.convertBinaryToDecimal()
                    }
                }
                
                Section(header: Text("Decimal Value")) {
                    Text("\(decimalValue)")
                }
                
            }
                
            .navigationBarTitle("Binary To Decimal")
            
            .alert(isPresented: $isShowingAlert) {
                Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
            
            
        }
    }
    
    func convertBinaryToDecimal() -> Int {
        var tempDouble = 0.0
        var factor = 0.0
        
        if binaryText.count > 8 {
            alertTitle = "Error"
            alertMessage = "Enter 8 digits or less"
            binaryText = ""
            isShowingAlert = true
            return 0
        }
        
        for i in binaryText {
            if i != "0" && i != "1" {
                alertTitle = "Error"
                alertMessage = "Enter only 0s or 1s"
                binaryText = ""
                isShowingAlert = true
                return 0
            }
        }
        
        
        if binaryText.count == 0 {
            factor = 0
        } else {
            factor = Double(binaryText.count) - 1.0
        }
        
        for i in binaryText {
            let d = Double(String(i))!
            tempDouble += d * pow(2, factor)
            factor -= 1.0
        }
        return Int(tempDouble)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
