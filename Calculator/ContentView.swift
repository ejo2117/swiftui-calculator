//
//  ContentView.swift
//  Calculator
//
//  Created by Ethan O'Neal on 10/6/23.
//

import SwiftUI

struct ContentView: View {
    @State var result: Int = 0;
    @State var leftOperand: Int? = 0;
    @State var rightOperand: Int? = nil;
    var body: some View {
        VStack {
            Text("Result: \(result)")
            Text("\(leftOperand ?? 0 )")
            Grid {
                GridRow {
                    ForEach(7..<10) {number in
                        Button("\(number)") {
                            rightOperand = number
                        }
                    }
                }
                GridRow {
                    ForEach(4..<7) {number in
                        Button("\(number)") {
                            rightOperand = number
                        }
                    }
                }
                GridRow {
                    ForEach(1..<4) {number in
                        Button("\(number)") {
                            rightOperand = number
                        }
                    }
                }
            }
            Button("Clear") {
                result = 0;
                leftOperand = 0;
                rightOperand = 0;
            }
            Button("Add"){
                leftOperand = rightOperand;
                rightOperand = nil;
            }
            Button("Equals"){
                // TODO: handle "nil" better?
                if(rightOperand == nil){
                    return;
                }
                // right is always the most recent thing added
                result = rightOperand! + leftOperand!;
                leftOperand = result;
            }
            // Calc stuff here
            
            
            
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
