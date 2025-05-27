//
//  SegmentedControl.swift
//  SOPT36_ANIMATION_SwiftUI
//
//  Created by LEESOOYONG on 5/27/25.
//

import SwiftUI

struct SegmentedControl: View {
    let categories: [String] = ["드라마", "예능", "영화", "스포츠"]
    
    @State private var selected: String = "드라마"
    
    @Namespace private var namespace
    // 뷰 간 연결을 위한 공통 식별자 그룹 -> matchedGeometryEffect가 서로 관련 있음을 알려준다.
    
    var body: some View {
        VStack {
            HStack {
                ForEach(categories, id: \.self) { category in
                    ZStack(alignment: .bottom) {
                        if selected == category {
                            Capsule()
                                .fill(.blue)
                                .matchedGeometryEffect(id: "categoryUnderLine", in: namespace).frame(width: 50, height: 3)
                                .offset(y:10)
                        }
                        Text(category)
                            .foregroundColor(selected == category ? .blue : .gray)
                            .font(.headline)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            selected = category
                        }
                    }
                }
            }
            .padding()
            
            Spacer()
            
            Text(emoji(category: selected)).font(.largeTitle)
            
            Spacer()
        }
    }
    
    func emoji(category: String) -> String {
        switch category {
            case "드라마":
            return "🎬"
        case "예능":
            return "😝"
        case "영화":
            return "🎥"
        case "스포츠":
            return "🏃‍♂️"
        default:
            return "🍎"
        }
    }
}

#Preview {
    SegmentedControl()
}
