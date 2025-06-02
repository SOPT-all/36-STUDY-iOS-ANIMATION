//
//  ContentView.swift
//  AnimationSwiftUI
//
//  Created by 김승원 on 6/3/25.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    
    @State private var progress: Double = 0.0
    
    // MARK: - body
    
    var body: some View {
        VStack {
            VStack(spacing: 15) {
                Image(.temp)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                
                CustomProgressView(progress: $progress)
                
                HStack(spacing: 10) {
                    Button {
                        progress += 0.1
                    } label: {
                        Text("눌러보시오")
                            .font(.subheadline)
                            .foregroundStyle(.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 15)
                            .background(.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .buttonStyle(.plain)
                    
                    Button {
                        progress = 0
                    } label: {
                        Text("초기화")
                            .font(.subheadline)
                            .foregroundStyle(.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 15)
                            .background(Color(.lightGray))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        .padding()
    }
}

// MARK: - CustomProgressView

struct CustomProgressView: View {
    
    // MARK: - Properties
    
    @Binding var progress: Double
    
    @State private var height: CGFloat = 30
    @State private var xOffset: CGFloat = 0
    
    // MARK: - body
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Color(.lightGray)
                    .frame(maxWidth: geometry.size.width)
                
                Color(.blue)
                    .frame(width: geometry.size.width * progress)
                    .animation(.bouncy(duration: 0.3, extraBounce: 0.1), value: progress)
            }
        }
        .frame(height: height)
        .clipShape(Capsule())
        .offset(x: xOffset)
        .onChange(of: progress) {
            if progress < 1.0 {
                animateHeightBump()
            } else {
                animateShake()
            }
        }
    }
    
    // MARK: - Functions
    
    private func animateHeightBump() {
        withAnimation(.bouncy(duration: 0.2, extraBounce: 0.1)) {
            height = 35
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            withAnimation(.easeOut(duration: 0.3)) {
                height = 30
            }
        }
    }
    
    private func animateShake() {
        withAnimation {
            xOffset = 20
            withAnimation(.interpolatingSpring(stiffness: 500, damping: 10)) {
                xOffset = 0
            }
        }
    }
}

#Preview {
    ContentView()
}
