//
//  ProgressViewExample.swift
//  LeeSeminAnimation
//
//  Created by 이세민 on 6/3/25.
//

import SwiftUI

struct ProgressViewExample: View {
    @State private var answers: [Bool?] = Array(repeating: nil, count: 3)
    
    var body: some View {
        VStack(spacing: 50) {
            ProgressView(value: Double(completedCount), total: 3)
                .padding(.horizontal)
                .accentColor(.black)
            
            ForEach(answers.indices, id: \.self) { index in
                HStack(spacing: 20) {
                    Text("문제 \(index + 1)")
                    
                    ForEach([true, false], id: \.self) { choice in
                        Button(choice ? "Yes" : "No") {
                            answers[index] = choice
                        }
                        .frame(width: 80, height: 40)
                        .background(answers[index] == choice ? (choice ? Color.blue : Color.red) : Color.clear)
                        .foregroundColor(answers[index] == choice ? .white : (choice ? .blue : .red))
                        .cornerRadius(8)
                    }
                }
            }
            
            Button(action: {}) {
                Text("제출하기")
                    .bold()
                    .padding()
            }
            .disabled(completedCount < 3)
            .background(completedCount < 3 ? Color.gray : Color.black)
            .foregroundColor(.white)
            .cornerRadius(12)
            .padding()
        }
    }
    
    private var completedCount: Int {
        answers.compactMap { $0 }.count
    }
}
