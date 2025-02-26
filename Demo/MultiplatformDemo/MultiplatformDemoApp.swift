//
//  MultiplatformDemoApp.swift
//  MultiplatformDemo
//
//  Created by Seyed Mojtaba Hosseini Zeidabadi on 8/8/22.
//

import SwiftUI

@main
struct MultiplatformDemoApp: App {
    private let issue: String?

    init() {
        let argument = ProcessInfo.processInfo.arguments.first { $0.hasPrefix("UIT-GHI-") }
        self.issue = argument?.split(separator: "-").map(String.init).last
    }

    var body: some Scene {
        WindowGroup {
            switch issue {
            case "118": Issue118()
            default: ContentView()
            }
        }
    }
}
