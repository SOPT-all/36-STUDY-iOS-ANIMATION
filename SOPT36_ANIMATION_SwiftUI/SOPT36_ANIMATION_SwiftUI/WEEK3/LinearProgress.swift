//
//  LinearProgress.swift
//  SOPT36_ANIMATION_SwiftUI
//
//  Created by LEESOOYONG on 6/3/25.
//

import SwiftUI

struct LinearProgress: View {
    @State private var progress = 0.2
    
    var body: some View {
        VStack {
            ProgressView(value: progress)
                .progressViewStyle(LinearProgressViewStyle())
                .padding()
            
            HStack(alignment: .center) {
                Button(action: {
                    if self.progress < 1.0 {
                        self.progress += 0.05
                    }
                }) {
                    Text("More")
                }
                Button(action: {
                    if self.progress >= 1.0 {
                        self.progress = 0.0
                    }
                }) {
                    Text("Reset")
                }
            }
        }
    }
}

#Preview {
    LinearProgress()
}
