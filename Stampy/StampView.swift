//
//  StampView.swift
//  Stampy
//
//  Created by F_s on 5/19/25.
//

import SwiftUI

struct StampView: View {
	@Environment(\.presentationMode) var presentationMode
	
	let challengeTitle: String
	let totalDays: Int = 50
	let stampsPerPage = 30
	
	@State private var currentPage = 0
	@State private var completedDays: Set<Int> = [0, 1, 2, 3, 4, 5, 6, 15, 16]  // 예시로 1~7일차, 16~17일차 완료
	
	var totalPages: Int {
		(totalDays + stampsPerPage - 1) / stampsPerPage
	}
	
	var body: some View {
		ZStack {
			Color(red: 227/255, green: 243/255, blue: 247/255)
				.ignoresSafeArea()
			
			VStack(spacing: 20) {
				Text("My Challenge 🐾")
					.font(.title)
					.bold()
				
				VStack(spacing: 16) {
					Text(challengeTitle)
						.font(.headline)
						.padding(.top, 8)
					
					// 스탬프 그리드
					let start = currentPage * stampsPerPage
					let end = min(start + stampsPerPage, totalDays)
					let currentItems = Array(start..<end)
					
					LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 5), spacing: 12) {
						ForEach(currentItems, id: \.self) { index in
							RoundedRectangle(cornerRadius: 4)
								.fill(completedDays.contains(index) ? Color.pink.opacity(0.6) : Color.gray.opacity(0.4))
								.frame(height: 40)
								.onTapGesture {
									if completedDays.contains(index) {
										completedDays.remove(index)
									} else {
										completedDays.insert(index)
									}
								}
						}
					}
					
					// 페이지 표시
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
					.padding(.horizontal, 40)
					
					// 돌아가기 버튼
					Button(action: {
						presentationMode.wrappedValue.dismiss()
					}) {
						Text("돌아가기")
							.foregroundColor(.white)
							.padding(.vertical, 10)
							.padding(.horizontal, 30)
							.background(Color(red: 55/255, green: 78/255, blue: 85/255))
							.cornerRadius(8)
					}
					.padding(.top, 10)
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
	}
}

#Preview {
	StampView(challengeTitle: "코테 1문제 풀기")
}

