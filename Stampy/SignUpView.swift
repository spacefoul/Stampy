//
//  SignUpView.swift
//  Stampy
//
//  Created by F_s on 5/19/25.
//

import SwiftUI

struct SignUpView: View {
	@Environment(\.presentationMode) var presentationMode
	
	@State private var email: String = ""
	@State private var password: String = ""
	@State private var confirmPassword: String = ""
	@State private var nickname: String = ""
	@State private var isPasswordVisible = false
	@State private var isConfirmPasswordVisible = false
	@State private var isSignedUp = false
	
	var body: some View {
		ZStack {
			// 🔹 배경 이미지
			Image("background2")
				.resizable()
				.scaledToFill()
				.ignoresSafeArea()
			
			VStack(spacing: 20) {
				Spacer()
				
				Text("회원가입")
					.font(.title)
					.bold()
				
				VStack(spacing: 16) {
					
					// 이메일
					TextField("이메일(아이디)를 입력해주세요", text: $email)
						.padding()
						.background(Color.white)
						.overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray))
						.padding(.horizontal)
					
					// 비밀번호
					HStack {
						if isPasswordVisible {
							TextField("비밀번호를 입력해주세요", text: $password)
						} else {
							SecureField("비밀번호를 입력해주세요", text: $password)
						}
						Button {
							isPasswordVisible.toggle()
						} label: {
							Image(systemName: isPasswordVisible ? "eye" : "eye.slash")
								.foregroundColor(.gray)
						}
					}
					.padding()
					.background(Color.white)
					.overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray))
					.padding(.horizontal)
					
					// 비밀번호 확인
					HStack {
						if isConfirmPasswordVisible {
							TextField("비밀번호를 다시 입력해주세요", text: $confirmPassword)
						} else {
							SecureField("비밀번호를 다시 입력해주세요", text: $confirmPassword)
						}
						Button {
							isConfirmPasswordVisible.toggle()
						} label: {
							Image(systemName: isConfirmPasswordVisible ? "eye" : "eye.slash")
								.foregroundColor(.gray)
						}
					}
					.padding()
					.background(Color.white)
					.overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray))
					.padding(.horizontal)
					
					// 닉네임
					TextField("닉네임을 입력해주세요", text: $nickname)
						.padding()
						.background(Color.white)
						.overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray))
						.padding(.horizontal)
				}
				
				Spacer()
				
				Button(action: {
					// 실제 회원가입 로직 처리 가능
					presentationMode.wrappedValue.dismiss()
				}) {
					Text("회원가입 완료")
						.frame(maxWidth: .infinity)
						.padding()
						.background(Color(red: 57/255, green: 71/255, blue: 75/255))
						.foregroundColor(.white)
						.cornerRadius(10)
						.padding(.horizontal)
				}
				
				Spacer()
			}
		}
	}
}

#Preview {
	SignUpView()
}


#Preview {
    SignUpView()
}
