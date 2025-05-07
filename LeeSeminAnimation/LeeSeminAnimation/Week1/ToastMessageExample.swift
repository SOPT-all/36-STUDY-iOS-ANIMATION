//
//  ToastMessageExample.swift
//  LeeSeminAnimation
//
//  Created by 이세민 on 5/5/25.
//

import SwiftUI

struct ToastMessageExample: View {
    @State private var showToast = false
    @State private var offsetY: CGFloat = 0
    @State private var opacity = 1.0
    
    var body: some View {
        VStack {
            if showToast {
                Text("토스트 🍞")
                    .padding()
                    .background(Color(red: 1.0, green: 0.95, blue: 0.7))
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .offset(y: offsetY)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeOut(duration: 3.0)) {
                            offsetY += 150
                            opacity = 0
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                            showToast = false
                            offsetY = 0
                            opacity = 1
                        }
                    }
            }
            
            Spacer()
            
            Button("토스트 메시지 보기") {
                showToast = true
            }
            .padding()
            .background(Color(red: 0.8, green: 0.6, blue: 0.4))
            .foregroundColor(.black)
            .cornerRadius(10)
        }
        .padding()
    }
}

#Preview {
    ToastMessageExample()
}
