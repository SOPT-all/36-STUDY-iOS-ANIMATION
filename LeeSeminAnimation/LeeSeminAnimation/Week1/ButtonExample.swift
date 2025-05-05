//
//  ButtonExample.swift
//  LeeSeminAnimation
//
//  Created by 이세민 on 5/6/25.
//

import SwiftUI

struct ButtonExample: View {
    @State private var isPressed = false
    
    var body: some View {
        Button(action: {
            withAnimation(.easeOut(duration: 0.1)) {
                isPressed = true
            }
            withAnimation(.easeOut(duration: 0.1).delay(0.1)) {
                isPressed = false
            }
        }) {
            Text("Button")
                .font(.title)
                .padding()
                .background(Color(red: 1.0, green: 0.95, blue: 0.6))
                .foregroundColor(.black)
                .cornerRadius(12)
                .scaleEffect(isPressed ? 0.9 : 1.0)
                .opacity(isPressed ? 0.8 : 1.0)
        }
    }
}

#Preview {
    ButtonExample()
}
