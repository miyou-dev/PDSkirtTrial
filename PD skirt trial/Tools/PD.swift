//
//  PD.swift
//  PD skirt trial
//
//  Created by 黄嘉豪 on 2021/9/21.
//

import Foundation

func startPrlctl(PDName: String) {
    var task = Process()
    // 启动PD
    task.launchPath = "/usr/bin/open"
    task.arguments = ["/Applications/Parallels Desktop.app"]
    task.launch()
    task.waitUntilExit()
    print(task.terminationStatus)
    
    // 开启虚拟机
    task = Process()
    task.launchPath = "/usr/local/bin/prlctl"
    task.arguments = ["start", PDName]
    task.launch()
    task.waitUntilExit()
    print(task.terminationStatus)
}
