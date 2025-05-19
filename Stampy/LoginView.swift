//
//  LoginView.swift
//  Stampy
//
//  Created by F_s on 5/19/25.
//

import SwiftUI

struct LoginView: View {
	@State private var email: String = ""
	@State private var password: String = ""
	@State private var isPasswordVisible = false
	@State private var isLoggedIn = false
	
	var body: some View {
		VStack(spacing: 20) {
			Spacer()
			
			Text("Stamy 🐾")
				.font(.title)
				.bold()
			
			VStack(spacing: 16) {
				TextField("이메일(아이디)를 입력해주세요", text: $email)
					.padding()
					.background(Color.white)
					.overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray))
					.padding(.horizontal)
				
				HStack {
					if isPasswordVisible {
						TextField("비밀번호를 입력해주세요", text: $password)
					} else {
						SecureField("비밀번호를 입력해주세요", text: $password)
					}
					Button(action: {
						isPasswordVisible.toggle()
					}) {
						Image(systemName: isPasswordVisible ? "eye" : "eye.slash")
							.foregroundColor(.gray)
					}
				}
				.padding()
				.background(Color.white)
				.overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray))
				.padding(.horizontal)
			}
			
			HStack {
				Text("이메일 찾기")
				Spacer().frame(width: 10)
				Text("|")
				Spacer().frame(width: 10)
				Text("비밀번호 찾기")
			}
			.font(.footnote)
			.foregroundColor(.gray)
			
			Spacer()
			
			Button(action: {
				isLoggedIn = true
			}) {
				Text("로그인")
					.frame(maxWidth: .infinity)
					.padding()
					.background(Color(red: 57/255, green: 71/255, blue: 75/255))
					.foregroundColor(.white)
					.cornerRadius(10)
					.padding(.horizontal)
			}
			
			Spacer()
		}
		.background(Color(red: 227/255, green: 243/255, blue: 247/255))
		.ignoresSafeArea()
		.fullScreenCover(isPresented: $isLoggedIn) {
			ContentView()
		}
	}
}
#Preview {
    LoginView()
}
