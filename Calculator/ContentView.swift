//
//  ContentView.swift
//  Calculator
//
//  Created by Ethan O'Neal on 10/6/23.
//

import SwiftUI

struct ContentView: View {
    enum OperatorType {
        case add, subtract
    }
    
    @State var result: Int = 0;
    @State var leftOperand: Int? = 0;
    @State var rightOperand: Int? = nil;
    @State var input: String = "";
    @State var operatorType: OperatorType? = nil;
    
    
    // value to display
        // either current input or result
    
    
    
    var body: some View {
        VStack {
//            Text("Result: \(result)")
            // "Display" Logic
                // If "inputting" (input has length ?) display input value
                // Else Display "result"
            Text("\( input.count == 0 ? String(result) : String(Int(input)!) )")
            Grid {
                GridRow {
                    ForEach(7..<10) {number in
                        Button("\(number)") {
                            input += String(number);
                            rightOperand = Int(input)
                        }
                    }
                }
                GridRow {
                    ForEach(4..<7) {number in
                        Button("\(number)") {
                            input += String(number);
                            rightOperand = Int(input)
                        }
                    }
                }
                GridRow {
                    ForEach(1..<4) {number in
                        Button("\(number)") {
                            input += String(number);
                            rightOperand = Int(input)
                        }
                    }
                }
                GridRow {
                    Button("0") {
                        input += "0"
                        rightOperand = Int(input)
                    }
                }
            }
            Button("Clear") {
                result = 0;
                leftOperand = 0;
                rightOperand = 0;
                input = "";
            }
            // Really clicking any operator should just signal that we're in a "entering" state
            // Need to store the operator value
            Button("Add"){
                // "Operator Clicked" Logic
                    // If "operand" is not nil, add(?) current input to result
                    // Value of current input is stored as operand
                    
                    
                leftOperand = rightOperand;
                result = leftOperand ?? 0;
                input = "";
//                rightOperand = nil;
            }
            Button("Equals"){
                
                // "Execute" Logic
                
                // TODO: handle "nil" better?
//                if(rightOperand == nil){
//                    return;
//                }
                // right is always the most recent thing added
                result = (rightOperand ?? 0) + (leftOperand ?? 0);
                leftOperand = result;
                input = ""
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
