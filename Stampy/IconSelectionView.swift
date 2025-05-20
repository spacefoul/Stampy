//
//  IconSelectionView.swift
//  Stampy
//
//  Created by F_s on 5/20/25.
//

import SwiftUI

struct IconSelectionView: View {
	let onSelect: (ChallengeTemplate) -> Void
	@Environment(\.dismiss) var dismiss
	
	var body: some View {
		ScrollView {
			LazyVGrid(
				columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())],
				spacing: 15) {
				ForEach(ChallengeData.all) { template in
					Button {
						onSelect(template)
						dismiss()
					} label: {
						VStack {
							
							Image(systemName: template.icon)
								.resizable()
								.scaledToFit() // 비율 유지하면서 최대 크기에 맞춤
								.frame(maxWidth: 35, maxHeight: 30) // 최대 크기만 제한
								.padding(.horizontal, 30)
								.padding(.vertical, 20)
								.foregroundColor(.black.opacity(0.7))
								.background(template.color)
								.clipShape(RoundedRectangle(cornerRadius: 12))

							Text(template.icon)
								.foregroundColor(.gray)
								.font(.caption2)
								.lineLimit(1)
						}
					}
				}
			}
			.padding()
		}
	}
}


#Preview {
	IconSelectionView { selectedTemplate in
		print("미리보기에서 선택된 템플릿: \(selectedTemplate.icon)")
	}
}
