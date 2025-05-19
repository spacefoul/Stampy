//
//  ContentView.swift
//  Stampy
//
//  Created by F_s on 5/19/25.
//

import SwiftUI

struct ChallengeItem: Identifiable {
	let id = UUID()
	let title: String
	let icon: String
	let color: Color
}

struct ContentView: View {
	@State private var showChallengeView = false
	
	let challenges: [ChallengeItem] = [
		ChallengeItem(title: "추가하기", icon: "plus", color: .white),
		ChallengeItem(title: "영어 단어 외우기", icon: "book", color: Color.green),
		ChallengeItem(title: "코테 1문제 풀기", icon: "display", color: Color.pink.opacity(0.6)),
		ChallengeItem(title: "유산균 먹기", icon: "pills", color: Color.blue.opacity(0.6)),
		ChallengeItem(title: "아침 챙겨먹기", icon: "fork.knife", color: Color.green.opacity(0.5)),
		ChallengeItem(title: "러닝머신 30분 이상 뛰기", icon: "figure.run", color: Color.teal)
	]
	
	var body: some View {
		NavigationView {
			VStack {
				Text("My Challenge 🐾")
					.font(.title)
					.bold()
					.padding(.top, 20)
				
				LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
					ForEach(challenges) { challenge in
						VStack {
							RoundedRectangle(cornerRadius: 20)
								.fill(Color.white)
								.shadow(radius: 5)
								.overlay(
									VStack {
										RoundedRectangle(cornerRadius: 12)
											.fill(challenge.color)
											.frame(height: 80)
											.overlay(
												Image(systemName: challenge.icon)
													.resizable()
													.scaledToFit()
													.frame(width: 40, height: 40)
													.foregroundColor(.black)
											)
										
										Text(challenge.title)
											.font(.subheadline)
											.foregroundColor(.black)
											.padding(.top, 15)
									}
										.padding()
								)
								.onTapGesture {
									if challenge.title == "추가하기" {
										showChallengeView = true
									}
								}
						}
						.frame(height: 140)
					}
				}
				.padding()
				
				Spacer()
			}
			.background(Color(red: 227/255, green: 243/255, blue: 247/255))
			.navigationBarHidden(true)
			.background(
				NavigationLink("", destination: ChallengeView(), isActive: $showChallengeView)
					.opacity(0)
			)
		}
	}
}


#Preview {
    ContentView()
}
