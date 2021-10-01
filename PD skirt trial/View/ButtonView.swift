//
//  ButtonView.swift
//  PD skirt trial
//
//  Created by 黄嘉豪 on 2021/9/21.
//

import SwiftUI


struct ButtonView: View {
    let id: Int
    let title: String
    let icon: String
    @Binding var selectedId: Int


    var body: some View {
        Label(title, systemImage: icon)
                .font(.system(size: 11))
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(id == selectedId ? Color.accentColor : nil)
                .cornerRadius(8)
                .onHover(perform: { x in
                    withAnimation(.spring()) {
                        selectedId = id
                    }

                })

    }
}
