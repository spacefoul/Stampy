//
//  SplashView.swift
//  Stampy
//
//  Created by F_s on 5/19/25.
//

import SwiftUI

struct SplashView: View {
	@State private var isActive = false
	
	var body: some View {
		if isActive {
			LoginView()
		} else {
			VStack {
				Text("🔥 챌린지 시작! 🔥")
					.font(.largeTitle)
					.bold()
				Spacer().frame(height: 40)
				ProgressView()
			}
			.onAppear {
				DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
					isActive = true
				}
			}
		}
	}
}
