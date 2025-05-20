//
//  ContentView.swift
//  Stampy
//
//  Created by F_s on 5/19/25.
//

import SwiftUI

struct ContentView: View {
	@State private var showChallengeView = false
	@State private var selectedItem: ChallengeItem? = nil
	
	@State private var challenges: [ChallengeItem] = [
		ChallengeItem(title: "추가하기", days: 0, icon: "plus", color: .white),
		ChallengeItem(title: "채소 먹기", days: 30, icon: "fork.knife", color: Color.green.opacity(0.5)),
		ChallengeItem(title: "매일 30분마다 운동", days: 100, icon: "figure.run", color: Color.teal),
		ChallengeItem(title: "1시 전에 자기",days: 20, icon: "bed.double.fill", color: Color.indigo.opacity(0.6))
	]
	
	var body: some View {
		NavigationStack {
			ZStack {
				Image("background2")
					.resizable()
					.scaledToFill()
					.ignoresSafeArea()
				
				VStack {
					Spacer(minLength: 120)
					
					Text("My Place 🏠")
						.font(.title)
						.bold()
						.padding(.top, 20)
					
					ScrollView {
						LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
							if let addButton = challenges.first(where: { $0.title == "추가하기" }) {
								Button {
									showChallengeView = true
								} label: {
									ChallengeCard(challenge: addButton)
										.padding(8)
								}
							}
							
							ForEach(challenges.filter { $0.title != "추가하기" }) { challenge in
								NavigationLink(destination: StampView(challengeTitle: challenge.title, totalDays: challenge.days, challengeColor: challenge.color)) {
									ChallengeCard(challenge: challenge)
										.padding(8)
								}
							}
						}
						.padding()
					}
					
					Spacer()
				}
			}
			.navigationBarHidden(true)
			.sheet(isPresented: $showChallengeView) {
				ChallengeView { newItem in
					challenges = [challenges.first!] + [newItem] + challenges.dropFirst()
				}
			}
		}
	}
}

struct ChallengeCard: View {
	let challenge: ChallengeItem
	
	var body: some View {
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
									.scaledToFit() // 비율 유지하면서 최대 크기에 맞춤
									.frame(maxWidth: 50, maxHeight: 40) // 최대 크기만 제한
									.padding(.horizontal, 30)
									.padding(.vertical, 20)
									.foregroundColor(.black.opacity(0.7))
									.clipShape(RoundedRectangle(cornerRadius: 12))
								
//								
//									.resizable()
//									.scaledToFit()
//									.frame(width: 50, height: 50)
//									.foregroundColor(Color.black.opacity(0.7))
							)
						Text(challenge.title)
							.font(.subheadline)
							.foregroundColor(.black)
							.padding(.top, 5)
					}
						.padding()
				)
		}
		.frame(height: 140)
	}
}

#Preview {
	ContentView()
}
