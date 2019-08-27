//
//  AddButtonView.swift
//  Habits


import SwiftUI

struct AddButtonView: View {
    var onPressed: () -> Void
    
    var body: some View {
        Button(action: {
            self.onPressed()
        }) {
            HStack {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .foregroundColor(Color.blue)
            }
        }
    }
}
