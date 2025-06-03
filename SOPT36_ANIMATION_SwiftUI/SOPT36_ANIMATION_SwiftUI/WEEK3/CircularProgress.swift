//
//  CircularProgress.swift
//  SOPT36_ANIMATION_SwiftUI
//
//  Created by LEESOOYONG on 6/3/25.
//

import SwiftUI

struct CircularProgress: View {
    @State private var progress = 0.0
    
    var body: some View {
        VStack {
            Slider(value: $progress)
                .padding()
            
            ZStack{
                Circle()
                    .stroke(Color.gray.opacity(0.5), lineWidth: 10)
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round))
                    .fill(Color.blue)
                    .rotationEffect(.degrees(-90))
                Text("\(String(format:"%.1f", progress*100))"+"%")
                    .font(.title)
            }
            .padding()
        }
    }
}

#Preview {
    CircularProgress()
}
