//
//  StampView.swift
//  Stampy
//
//  Created by F_s on 5/19/25.
//

import SwiftUI

struct StampView: View {
	let challengeTitle: String
	let totalDays: Int
	let challengeColor: Color
	
	let stampsPerPage = 30
	@State private var currentPage = 0
	@State private var completedDays: Set<Int> = [0, 1, 2, 3, 4, 5, 6, 15, 16]
	@Environment(\.dismiss) private var dismiss  // ⬅️ Navigation back
	
	var totalPages: Int {
		(totalDays + stampsPerPage - 1) / stampsPerPage
	}
	
	var body: some View {
		ZStack {
			Image("background2")
				.resizable()
				.scaledToFill()
				.ignoresSafeArea()
			
			VStack(spacing: 20) {
				Spacer()
				Text("My Challenge 🐾")
					.font(.title)
					.bold()
				
				VStack(spacing: 16) {
					Text(challengeTitle)
						.font(.title2)
						.padding(.vertical, 12)
					
					let start = currentPage * stampsPerPage
					let end = min(start + stampsPerPage, totalDays)
					let currentItems = Array(start..<end)
					
					LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 5), spacing: 20) {
						ForEach(currentItems, id: \.self) { index in
							RoundedRectangle(cornerRadius: 4)
								.fill(completedDays.contains(index) ? challengeColor : Color.gray.opacity(0.4))
								.frame(height: 35)
								.frame(width: 45)
								.onTapGesture {
									if completedDays.contains(index) {
										completedDays.remove(index)
									} else {
										completedDays.insert(index)
									}
								}
						}
					}
					
					HStack {
						
						Button(action: {
							if currentPage > 0 { currentPage -= 1 }
						}) {
							Image(systemName: "chevron.left")
						}
						.disabled(currentPage == 0)
						
						Spacer()
						Text("\(currentPage + 1)/\(totalPages)")
						Spacer()
						
						Button(action: {
							if currentPage < totalPages - 1 { currentPage += 1 }
						}) {
							Image(systemName: "chevron.right")
						}
						.disabled(currentPage == totalPages - 1)
					}
					.padding(.top, 20)
					.padding(.bottom, 10)
					
					// 🔹 돌아가기 버튼
					Button(action: {
						dismiss() // ✅ NavigationStack의 뒤로가기
					}) {
						Text("돌아가기")
							.foregroundColor(.white)
							.padding(.vertical, 12)
							.padding(.horizontal, 36)
							.background(Color(red: 55/255, green: 78/255, blue: 85/255))
							.cornerRadius(8)
					}
					.padding(.bottom, 10)
				}
				.padding()
				.background(Color.white)
				.cornerRadius(20)
				.shadow(radius: 5)
				.padding(.horizontal, 20)
				
				Spacer()
			}
			.padding(.top, 40)
		}
		.navigationBarBackButtonHidden(true) // 시스템 back 숨기고
	}
}

#Preview {
	StampView(challengeTitle: "1시 전에 자기", totalDays: 30, challengeColor: Color.indigo.opacity(0.6))
}

