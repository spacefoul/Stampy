//
//  ChallengeView.swift
//  Stampy
//
//  Created by F_s on 5/19/25.
//

import SwiftUI

struct ChallengeView: View {
	@Environment(\.dismiss) var dismiss
	
	@State private var title: String = ""
	@State private var duration: String = ""
	@State private var selectedTemplate: ChallengeTemplate? = nil
	@State private var showIconSelector = false
	
	var onComplete: (ChallengeItem) -> Void
	
	var body: some View {
		ZStack {
			Image("background2")
				.resizable()
				.scaledToFill()
				.ignoresSafeArea()
			
			VStack(spacing: 20) {
				Spacer()
				Text("New Stampy 🐾")
					.font(.title)
					.bold()
				
				VStack(alignment: .leading, spacing: 16) {
					// 제목 입력
					Text("제목")
						.fontWeight(.semibold)
					TextField("챌린지 제목을 입력해주세요", text: $title)
						.padding()
						.background(Color.white)
						.cornerRadius(8)
						.overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray.opacity(0.4)))
					
					
					// 기간 입력
					Text("기간 (일)")
						.fontWeight(.semibold)
					TextField("예: 100", text: $duration)
						.keyboardType(.numberPad)
						.padding()
						.background(Color.white)
						.cornerRadius(8)
						.overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray.opacity(0.4)))
					
					// 아이콘 선택 버튼
					Text("아이콘 선택")
						.fontWeight(.semibold)
					Button(action: {
						showIconSelector = true
					}) {
						HStack {
							if let template = selectedTemplate {
								Image(systemName: template.icon)
									.resizable()
									.frame(width: 20, height: 20)
									.padding(6)
									.padding(.horizontal, 15)
									.padding(.vertical, 10)
									.foregroundColor(.black.opacity(0.7))
									.background(template.color)
									.clipShape(RoundedRectangle(cornerRadius: 12))
								Text(template.icon)
									.foregroundColor(.black)
							} else {
								Text("아이콘을 선택해주세요")
									.foregroundColor(.gray)
							}
							Spacer()
							Image(systemName: "chevron.right")
								.foregroundColor(.gray)
						}
						.padding()
						.background(Color.white)
						.cornerRadius(8)
					}
				}
				.padding()
				.background(Color.white)
				.cornerRadius(20)
				.shadow(radius: 5)
				.padding(.horizontal, 20)
				
				// 생성 버튼
				Button(action: {
					if let template = selectedTemplate,
						!title.trimmingCharacters(in: .whitespaces).isEmpty {
						
						if let days = Int(duration), days > 0 {
							let newItem = ChallengeItem(title: title, days: days, icon: template.icon, color: template.color)
							onComplete(newItem)
							dismiss()
						}

					}
				}) {
					Text("도장판 생성하기")
						.frame(maxWidth: .infinity)
						.padding()
						.background(Color(red: 55/255, green: 78/255, blue: 85/255))
						.foregroundColor(.white)
						.cornerRadius(10)
						.padding(.horizontal)
				}
				
				Spacer()
			}
			.padding(.top, 40)
		}
		.sheet(isPresented: $showIconSelector) {
			IconSelectionView { selected in
				self.selectedTemplate = selected
				self.showIconSelector = false
			}
		}
	}
}


#Preview {
	NavigationStack {
		ChallengeView { item in
			print("미리보기에서 생성된 챌린지: \(item.title)")
		}
	}
}


