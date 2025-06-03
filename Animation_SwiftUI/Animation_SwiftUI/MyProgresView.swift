//
//  MyProgresView.swift
//  Animation_SwiftUI
//
//  Created by hyunwoo on 6/3/25.
//
import SwiftUI

struct MyProgressView: View {
    @State private var progress = 0.5
    @State private var timerRunning = true

    var body: some View {
        VStack(spacing: 20) {
            ProgressView(value: progress)
                .progressViewStyle(LinearProgressViewStyle())
                .padding()

            Button("More") {
                if progress < 1.0 {
                    progress += 0.05
                    if progress >= 1.0 {
                        timerRunning = false
                    }
                }
            }

            if timerRunning {
                // 기본 ProgressView() (인디케이터) 표시
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            }
        }
        .onAppear {
            // 3초마다 progress 증가시키는 타이머
            Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { timer in
                if progress < 1.0 {
                    progress += 0.05
                } else {
                    timer.invalidate()
                    timerRunning = false
                }
            }
        }
    }
}

#Preview {
    MyProgressView()
}
