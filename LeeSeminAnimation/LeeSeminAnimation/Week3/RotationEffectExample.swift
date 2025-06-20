//
//  RotationEffectExample.swift
//  LeeSeminAnimation
//
//  Created by 이세민 on 6/3/25.
//

import SwiftUI

struct RotationEffectExample: View {
    @State private var progress: Double = 0.0

    var body: some View {
        VStack(spacing: 70) {
            ZStack {
                Circle()
                    .stroke(Color.gray.opacity(0.3), lineWidth: 15)
                
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(Color.black, style: StrokeStyle(lineWidth: 20, lineCap: .round))
                    .rotationEffect(.degrees(-90))
                    .animation(.easeInOut, value: progress)
                
                Text("\(Int(progress * 100))%")
                    .font(.title)
                    .bold()
            }
            .frame(width: 150, height: 150)
            
            Slider(value: $progress)
                .padding(.horizontal)
                .accentColor(.black)
        }
    }
}
