//
//  VirtualMachineListView.swift
//  PD skirt trial
//
//  Created by 黄嘉豪 on 2021/9/21.
//

import SwiftUI

struct VirtualMachineListView: View {

    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: VirtualMachine.entity(), sortDescriptors: []) var virtualMachineList: FetchedResults<VirtualMachine>
    @State var selectedVirtualMachine: VirtualMachine?

    var body: some View {
        // 显示列表
        List(virtualMachineList, id: \.self, selection: $selectedVirtualMachine) { item in
            HStack {
                Group {
                    Image(systemName: selectedVirtualMachine == item ? "star.fill" : "star")
                    VStack(alignment: .leading) {
                        Text(item.name ?? "")
                        Text(item.describe ?? "")
                                .foregroundColor(.gray)

                    }
                    Spacer()
                }
                        .onTapGesture {
                            print(item.name ?? "")
                            // 开启虚拟机
                            startPrlctl(PDName: item.name ?? "")
                        }
                Image(systemName: "trash.circle.fill")
                        .foregroundColor(selectedVirtualMachine == item ? .red : nil)
                        .onTapGesture {
                            delete(item)
                        }
            }.onHover(perform: { _ in
                // 鼠标经过
                withAnimation(.spring()) {
                    selectedVirtualMachine = item
                }
            })
        }
    }

    // 删除
    func delete(_ item: VirtualMachine) {
        print("删除")
        viewContext.delete(item)
        try? self.viewContext.save()
    }
}

struct VirtualMachineListView_Previews: PreviewProvider {
    static var previews: some View {
        VirtualMachineListView()
    }
}
