//
//  SettingsView.swift
//  OverloadPT
//
//  Created by Suleyman Kiani on 2025-06-12.
//


import SwiftUI

struct SettingsView: View {
    var body: some View {
        Form {
            Section("Units") {
                Text("lbs / kg toggle – TBD")
            }
            Section("About") {
                Text("Version 0.1.0")
            }
        }
        .navigationTitle("Settings")
    }
}

#Preview { SettingsView() }