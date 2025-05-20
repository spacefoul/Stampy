//
//  ChallengeItem.swift
//  Stampy
//
//  Created by F_s on 5/20/25.
//

import SwiftUI

struct ChallengeItem: Identifiable {
	let id = UUID()
	let title: String
	let days: Int
	let icon: String
	let color: Color
}

