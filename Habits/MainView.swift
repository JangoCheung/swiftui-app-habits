//
//  Main.swift
//  Habits


import SwiftUI

struct MainView: View {
    @State var habitItemList: [HabitItem] = [
        HabitItem(name: "起床", iconName: IconNameArray[0], theme: UserColorArray[0]),
        HabitItem(name: "阅读", iconName: IconNameArray[1], theme: UserColorArray[2]),
        HabitItem(name: "书写", iconName: IconNameArray[2], theme: UserColorArray[3]),
        HabitItem(name: "工作", iconName: IconNameArray[3], theme: UserColorArray[4]),
        HabitItem(name: "娱乐", iconName: IconNameArray[4], theme: UserColorArray[5]),
        HabitItem(name: "运动", iconName: IconNameArray[5], theme: UserColorArray[6]),
        HabitItem(name: "冥想", iconName: IconNameArray[6], theme: UserColorArray[7]),
    ]
    @State var currentDetailHabit: HabitItem = HabitItem()
    @State var sheetVisible: Bool = false
    @State var sheetType: String = "add"
    
    var body: some View {
        ZStack {
            NavigationView {
                HabitListView(habitItemList: self.habitItemList, onPressed: { item in
                    self.sheetType = "detail"
                    self.currentDetailHabit = item
                    self.sheetVisible = true
                }).navigationBarTitle(Text("本周概况"), displayMode: .large)
            }
            
            AddButtonView() {
                self.sheetType = "add"
                self.sheetVisible = true
            }.offset(x: UIScreen.main.bounds.width / 2 - 60, y: UIScreen.main.bounds.height / 2 - 100)
            
        }.sheet(isPresented: $sheetVisible) {
            if self.sheetType == "detail" {
                HabitDetailView(habitItem: self.$currentDetailHabit, onDelete: { uuid in
                    let index = self.habitItemList.firstIndex(where: { $0.uuid == uuid })

                    if index != nil {
                        self.habitItemList.remove(at: index!)
                    }
                    self.sheetVisible = false
                }, onDissmis: { self.sheetVisible = false })
            } else {
                AddItemView(onSumit: { item in
                    self.habitItemList.insert(item, at: 0)
                    self.sheetVisible = false
                }, onDissmis: { self.sheetVisible = false })
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
