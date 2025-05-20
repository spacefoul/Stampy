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
			// 메인 화면으로 전환 (예: ContentView)
			LoginView()
		} else {
			ZStack {
				Image("SplashImage")
					.resizable()
					.scaledToFill()
					.ignoresSafeArea() // 전체 화면으로
				
				// 여기에 로고나 텍스트 추가 가능
				// Text("앱 이름").font(.largeTitle).bold().foregroundColor(.white)
			}
			.onAppear {
				DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
					withAnimation {
						isActive = true
					}
				}
			}
		}
	}
}

#Preview {
	SplashView()
}
