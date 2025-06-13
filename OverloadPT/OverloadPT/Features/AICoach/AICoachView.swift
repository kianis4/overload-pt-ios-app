//
//  AICoachView.swift
//  OverloadPT
//
//  Created by Suleyman Kiani on 2025-06-12.
//


import SwiftUI

struct AICoachView: View {
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "brain")
                .font(.system(size: 48))
            Text("AI Coach chat coming soon")
                .font(.title3)
                .foregroundStyle(.secondary)
        }
        .navigationTitle("AI Coach")
    }
}

#Preview { AICoachView() }