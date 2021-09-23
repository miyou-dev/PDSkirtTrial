//
//  VirtualMachineCreateView.swift
//  PD skirt trial
//
//  Created by 黄嘉豪 on 2021/9/21.
//

import SwiftUI

struct VirtualMachineCreateView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    var delegate: VirtualMachineCreateViewDelegate?
    
    @State private var selectedOS = "macOS"
    let OSs = ["macOS", "Windows", "Linux", "Other"]
    @State var name: String = ""
    @State var describe: String = ""
    

    var body: some View {
        
        
        VStack {
            List {
                Picker("OS", selection: $selectedOS) {
                    ForEach(OSs, id: \.self) {
                        Text($0)
                    }
                }
                HStack {
                    Text("名称")
                    TextField("name", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                HStack {
                    Text("描述")
                    TextField("describe", text: $describe)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
            }
            Spacer()
            HStack(alignment: .center, spacing: 4) {
                Spacer()
                
                Button("添加") {
                    create()
                }
                .font(.system(size: 11))
                
                
            }
            .padding(.horizontal, 8)
            .padding(.bottom, 8)
        }
        
    }
    
    func create() {
        if (!name .isEmpty && !describe.isEmpty){
            print("create")
            let t =  VirtualMachine(context: self.viewContext)
            t.id = UUID()
            t.name = name
            t.describe = describe
            t.os = selectedOS
            t.createDate = Date()
            try? self.viewContext.save()
            
            name = ""
            describe = ""
            delegate?.virtualMachineCreated()
        }
        
      
    }
    
}

protocol VirtualMachineCreateViewDelegate {
    func virtualMachineCreated()
}


struct VirtualMachineCreateView_Previews: PreviewProvider {
    static var previews: some View {
        VirtualMachineCreateView()
    }
}
