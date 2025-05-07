//
//  TransformExample.swift
//  LeeSeminSU
//
//  Created by 이세민 on 5/5/25.
//

import SwiftUI

struct TransformExample: View {
    @State private var rotate = false
    @State private var moveRight = false
    @State private var scaleUp = false
    
    var body: some View {
        VStack(spacing: 30) {
            Image(.glassesDumpling)
                .resizable()
                .frame(width: 130, height: 130)
            
                .rotationEffect(.degrees(rotate ? 360 : 0))
                .animation(.easeInOut(duration: 1), value: rotate)
            
                .offset(x: moveRight ? 130 : 0)
                .animation(.easeInOut(duration: 1), value: moveRight)
            
                .scaleEffect(scaleUp ? 2.0 : 1.0)
                .animation(.easeInOut(duration: 1), value: scaleUp)
                .padding(50)
            
            HStack(spacing: 30) {
                Button("회전") {
                    rotate.toggle()
                }
                .padding()
                .background(Color(red: 0.8, green: 0.6, blue: 0.4))
                .foregroundColor(.black)
                .cornerRadius(10)
                
                Button("이동") {
                    moveRight.toggle()
                }
                .padding()
                .background(Color(red: 1.0, green: 0.95, blue: 0.7))
                .foregroundColor(.black)
                .cornerRadius(10)
                
                Button("크기") {
                    scaleUp.toggle()
                }
                .padding()
                .background(Color(red: 0.96, green: 0.87, blue: 0.7))
                .foregroundColor(.black)
                .cornerRadius(10)
            }
        }
        .padding()
    }
}

#Preview {
    TransformExample()
}
