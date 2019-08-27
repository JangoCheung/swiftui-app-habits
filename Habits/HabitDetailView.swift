//
//  HabitDetailView.swift
//  Habits


import SwiftUI

class DayOfWeek: Identifiable {
    var day: String = ""
    
    init(day: String) {
        self.day = day
    }
}

let dayList: [DayOfWeek]  = [
    DayOfWeek(day: "周一"),
    DayOfWeek(day: "周二"),
    DayOfWeek(day: "周三"),
    DayOfWeek(day: "周四"),
    DayOfWeek(day: "周五"),
    DayOfWeek(day: "周六"),
    DayOfWeek(day: "周日"),
]

struct HabitDetailView: View {
    @Binding var habitItem: HabitItem

    var onDelete: (Int) -> Void
    var onDissmis: () -> Void
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 20) {
                Text("习惯名称").font(.title).padding(.top, 50)
                
                HStack {
                    Image(systemName: habitItem.iconName)
                        .resizable()
                        .frame(width: 24, height: 24)
                        .padding(.trailing, 10)
                    Text(habitItem.name).font(.title)
                }.foregroundColor(habitItem.theme)
                
                Text("完成统计").font(.title)
                
                ForEach(0 ..< 7) { index in
                    Toggle(isOn: self.$habitItem.checkList[index]) {
                        Text(dayList[index].day)
                    }
                }
                
                Spacer()
                
                Button(action: {
                    self.onDissmis()
                }) {
                    Text("关闭").frame(minWidth: 0, maxWidth: .infinity)
                }
                    .accentColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                
                Button(action: {
                    self.onDelete(self.habitItem.uuid)
                }) {
                    Text("删除").frame(minWidth: 0, maxWidth: .infinity)
                }
                    .accentColor(.white)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(10)
                
                
                Spacer(minLength: 50)
            }.padding(.leading, 20).padding(.trailing, 20)
            
        }
    }
}
