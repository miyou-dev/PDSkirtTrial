//
//  MenuView.swift
//  PD skirt trial
//
//  Created by 黄嘉豪 on 2021/9/21.
//

import SwiftUI

struct MenuView: View, VirtualMachineCreateViewDelegate {
    
    
    //    @Environment(\.managedObjectContext) private var viewContext
    //    @FetchRequest(entity: VirtualMachine.entity(), sortDescriptors: []) var virtualMachineList: FetchedResults<VirtualMachine>
    //    @State var selectedVirtualMachine :VirtualMachine?
    
    @State var selectedId: Int = 0
    @State var selectedView: Int = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            
            
            HStack(alignment: .center, spacing: 4) {
                ButtonView(id: 0, title: "浏览", icon: "doc.plaintext", selectedId: $selectedId)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            selectedView = 0
                        }
                    }
                ButtonView(id: 1, title: "创建", icon: "pencil.and.outline", selectedId: $selectedId)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            selectedView = 1
                        }
                        
                    }
                Spacer()
                Image(systemName: "gear")
                    .font(.system(size: 11))
            }
            .padding(.horizontal, 8)
            .padding(.top, 8)
            
            
            if selectedView == 0 {
                VirtualMachineListView()
            } else {
                VirtualMachineCreateView(delegate: self)
                    
            }
            
            
        }
        .frame(width: 250, height: 300)
    }
    // 创建成功后执行
    func virtualMachineCreated () {
        withAnimation(.spring()) {
            selectedView = 0
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

