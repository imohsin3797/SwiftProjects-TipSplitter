//
//  ContentView.swift
//  TipSplitter
//
//  Created by Ibrahim Mohsin on 10/6/24.
//

import SwiftUI

struct ContentView: View {
    @State var checkAmount = ""
    @State var numPeople = ""
    
    let tipOptions = ["0%", "10%", "15%", "20%"]
    
    @State var selectedTip = "0%"
    
    var checkTotal: String{
        if(checkAmount == ""){
            return "0.00"
        }
        else{
            switch selectedTip{
            case "0%":
                return String(format: "%.2f", Double(checkAmount)!)
            case "10%":
                return String(format: "%.2f",(Double(checkAmount)! * 1.10))
            case "15%":
                return String(format: "%.2f",(Double(checkAmount)! * 1.15))
            case "20%":
                return String(format: "%.2f",(Double(checkAmount)! * 1.20))
            default:
                return "0.00"
            }
        }
    }
    
    var perPerson: String{
        if(numPeople == ""){
            return "0.00"
        }
        else{
            switch selectedTip{
            case "0%":
                return String(format: "%.2f", Double(checkTotal)! / Double(numPeople)!)
            case "10%":
                return String(format: "%.2f",(Double(checkTotal)! / Double(numPeople)!))
            case "15%":
                return String(format: "%.2f",(Double(checkTotal)! / Double(numPeople)!))
            case "20%":
                return String(format: "%.2f",(Double(checkTotal)! / Double(numPeople)!))
            default:
                return "0.00"
            }
        }
    }
    
    var body: some View {
        NavigationStack{
            Form{
                TextField("Amount", text: $checkAmount)
                TextField("Number of People", text: $numPeople)
                
                Section("How much tip do you want to leave?"){
                    Picker("Unit", selection: $selectedTip) {
                        ForEach(tipOptions, id: \.self) { tip in
                            Text(tip)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Check Total with Tip"){
                    Text("$\(checkTotal)")
                }
                
                Section("Amount per Person"){
                    Text("$\(perPerson)")
                }
            }
            .navigationTitle("WeSplit")
        }
    }
}

#Preview {
    ContentView()
}
