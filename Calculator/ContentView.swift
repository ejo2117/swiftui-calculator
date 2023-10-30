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
    @State var rightOperand: Int? = 0;
    @State var input: String = "";
    @State var operatorType: OperatorType? = nil;
    @State var inputWritable: Bool = false;
    @State var waitingForRightOperand: Bool = false;
    
    
    
    // value to display
        // either current input or result
    
    
    func ButtonComponent (number: Int) -> some View {
        return Button("\(number)") {
            if (inputWritable) {
                input = String(number);
                inputWritable = false;
            } else {
                input += String(number);
            }
            
            if(waitingForRightOperand){
                rightOperand = Int(input)
            }
            
           
        }
    }
    
    // Clicking "Equals":
        // put value of left + right into "result"
        // put writable result into display
    func equate() {
        result = (rightOperand ?? 0) + (leftOperand ?? 0);
        input = String(result)
        inputWritable = true;
        waitingForRightOperand = false;
        rightOperand = result;
    }
    
    
    
    var body: some View {
        VStack {
//            Text("Result: \(result)")
            // "Display" Logic
                // If "inputting" (input has length ?) display input value
                // Else Display "result"
            Text("Result: \(result)");
            Text("Left: \(leftOperand ?? 0)");
            Text("Right: \(rightOperand ?? 0)");
            Text("Input: \(input)");
            
            Text("\( input.count == 0 ? "~" + String(result) + "~" : String(Int(input)!) )")
            Grid {
                GridRow {
                    ForEach(7..<10) {number in
                        ButtonComponent(number: number)
                    }
                }
                GridRow {
                    ForEach(4..<7) {number in
                        ButtonComponent(number: number)
                    }
                }
                GridRow {
                    ForEach(1..<4) {number in
                        ButtonComponent(number: number)
                    }
                }
                GridRow {
                    ButtonComponent(number: 0)
                }
            }
            if (input.count > 0 || (rightOperand ?? 0) > 0) {
                Button("C") {
                    rightOperand = 0;
                    input = "";
                }
            } else {
                Button("AC") {
                    result = 0;
                    leftOperand = 0;
                    rightOperand = 0;
                    input = "";
                    waitingForRightOperand = false;
                }
            }
            
            
            
            
            // Clicking operator:
                // Clicking "="
                // ... Clicking Operator
                    // make display writable
            
            // Really clicking any operator should just signal that we're in a "entering" state
            // Need to store the operator value
            Button("Add"){
                if(waitingForRightOperand) {
                    equate()
                }
                leftOperand = Int(input)
                waitingForRightOperand = true;
                inputWritable = true;
                
//                equate()
                // Current input stored as... leftOperand(?)
                // Click -> Receive "Right Side" -> Display "Result" as writable input
                
                
                
                // Add input to result, set as left operand
                // Set input to empty
//                if(leftOperand == 0) {
//                    leftOperand = Int(input)
//
//                } else {
//                    result = (rightOperand ?? 0) + (leftOperand ?? 0);
//                    leftOperand = 0;
//                }
//                inputWritable = true;
                
                
                // "Operator Clicked" Logic
                    // Refresh result -- add current input to "result"
                    // If "operand" is not nil, add(?) current input to result
                    // Value of current input is stored as operand
//                leftOperand = (rightOperand ?? 0) + (leftOperand ?? 0);
//                result = leftOperand!;
//                input = ""
                    
//                leftOperand = rightOperand;
//                result = leftOperand ?? 0;
//                input = "";
//                rightOperand = nil;
            }.font(.system(size: 17, weight: waitingForRightOperand ? Font.Weight.bold : Font.Weight.regular))
            
            
            Button("Equals"){
                
                equate()
                
//                // "Execute" Logic
//
//                // TODO: handle "nil" better?
////                if(rightOperand == nil){
////                    return;
////                }
//                // right is always the most recent thing added
//                result = (rightOperand ?? 0) + (leftOperand ?? 0);
////                leftOperand = 0;
////                rightOperand = 0;
//                input = ""
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


