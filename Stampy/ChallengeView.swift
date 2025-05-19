//
//  ChallengeView.swift
//  Stampy
//
//  Created by F_s on 5/19/25.
//

import SwiftUI

struct ChallengeView: View {
	@Environment(\.presentationMode) var presentationMode
	
	@State private var title: String = ""
	@State private var selectedDuration: Int? = nil
	@State private var selectedColor: Color? = nil
	@State private var description: String = ""
	
	let durations: [Int] = [30, 50, 100, 300]
	let availableColors: [Color] = [.green, .purple, .pink, .yellow, .teal, .red]
	
	var body: some View {
		ZStack {
			Color(red: 227/255, green: 243/255, blue: 247/255)
				.ignoresSafeArea()
			
			VStack(spacing: 20) {
				Text("My Challenge 🐾")
					.font(.title)
					.bold()
				
				VStack(alignment: .leading, spacing: 20) {
					// 제목
					VStack(alignment: .leading, spacing: 4) {
						Text("제목")
							.fontWeight(.semibold)
						TextField("챌린지 이름을 작성해주세요.", text: $title)
							.padding(.bottom, 4)
						Rectangle()
							.frame(height: 1)
							.foregroundColor(.gray.opacity(0.5))
					}
					
					// 기간
					VStack(alignment: .leading, spacing: 4) {
						Text("기간")
							.fontWeight(.semibold)
						HStack(spacing: 10) {
							ForEach(durations, id: \.self) { duration in
								Text("\(duration)일")
									.padding(.vertical, 6)
									.padding(.horizontal, 12)
									.background(
										RoundedRectangle(cornerRadius: 6)
											.fill(selectedDuration == duration ? Color.gray.opacity(0.5) : Color.gray.opacity(0.2))
									)
									.onTapGesture {
										selectedDuration = duration
									}
							}
						}
					}
					
					// 배경색
					VStack(alignment: .leading, spacing: 4) {
						Text("배경색")
							.fontWeight(.semibold)
						HStack(spacing: 12) {
							ForEach(availableColors, id: \.self) { color in
								Circle()
									.fill(color)
									.frame(width: 30, height: 30)
									.overlay(
										Circle()
											.stroke(Color.black, lineWidth: selectedColor == color ? 2 : 0)
									)
									.onTapGesture {
										selectedColor = color
									}
							}
						}
					}
					
					// 내용
					VStack(alignment: .leading, spacing: 4) {
						Text("내용")
							.fontWeight(.semibold)
						TextEditor(text: $description)
							.frame(height: 200)
							.padding(8)
							.background(Color(red: 227/255, green: 243/255, blue: 247/255))
							.cornerRadius(8)
							.overlay(
								RoundedRectangle(cornerRadius: 8)
									.stroke(Color.gray.opacity(0.3))
							)
						
							.overlay(
								Group {
									if description.isEmpty {
										Text("챌린지에 대해 소개해주세요.")
											.foregroundColor(.gray)
											.padding(12)
											.allowsHitTesting(false)
									}
								}, alignment: .topLeading
							)
					}
					
					// 생성하기 버튼
					Button(action: {
						// 저장 로직 넣기
						presentationMode.wrappedValue.dismiss()
					}) {
						Text("생성하기")
							.foregroundColor(.white)
							.padding(.vertical, 10)
							.padding(.horizontal, 30)
							.background(Color(red: 55/255, green: 78/255, blue: 85/255))
							.cornerRadius(8)
					}
					.frame(maxWidth: .infinity, alignment: .center)
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
	ChallengeView()
}
