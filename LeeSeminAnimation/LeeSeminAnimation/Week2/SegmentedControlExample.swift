//
//  SegmentedControlExample.swift
//  LeeSeminAnimation
//
//  Created by 이세민 on 5/9/25.
//

import SwiftUI

struct SegmentedControlExample: View {
    @State private var firstSelection = 0
    @State private var secondSelection = 0
    
    let firstSegments = ["애", "니", "메", "이", "션"]
    let secondSegments = ["스", "터", "디"]
    
    @Namespace private var indicatorNamespace
    
    var body: some View {
        VStack {
            Picker("", selection: $firstSelection) {
                ForEach(0..<firstSegments.count, id: \.self) { index in
                    Text(firstSegments[index])
                }
            }
            .pickerStyle(.segmented)
            .padding()
            
            Text("Selected: \(firstSegments[firstSelection])")
                .padding()
        }
        .padding(.top, 100)
        
        Spacer()
        
        VStack {
            HStack {
                ForEach(0..<secondSegments.count, id: \.self) { index in
                    Button(action: {
                        withAnimation {
                            secondSelection = index
                        }
                    }) {
                        VStack {
                            Text(secondSegments[index])
                                .foregroundColor(secondSelection == index ? .primary : .gray)
                                .padding(.vertical, 8)
                            
                            if secondSelection == index {
                                Rectangle()
                                    .frame(height: 4)
                                    .foregroundColor(.black)
                                    .matchedGeometryEffect(id: "indicator", in: indicatorNamespace)
                            } else {
                                Color.clear.frame(height: 4)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                }
            }
            .padding(.horizontal)
            
            Text("Selected: \(secondSegments[secondSelection])")
                .padding()
        }
        .padding(.bottom, 100)
    }
}

#Preview {
    SegmentedControlExample()
}
