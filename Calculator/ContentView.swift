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
    @State var input: String = "";
    
    var body: some View {
        VStack {
            Text("Result: \(result)")
//            Text("\(leftOperand ?? 0 )")
            Text("\( input.count == 0 ? "0" : input )")
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
            }
            Button("Clear") {
                result = 0;
                leftOperand = 0;
                rightOperand = 0;
                input = "";
            }
            Button("Add"){
                
                leftOperand = rightOperand;
                input = "";
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
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
