//
//  AddItemView.swift
//  Habits


import SwiftUI

struct AddItemView: View {
    @State var newItemTitle = ""
    @State var selectIconIndex: Int = 0
    @State var selectColorIndex: Int = 0
    
    var onSumit: (HabitItem) -> Void
    var onDissmis: () -> Void
    
    var body: some View {
         VStack {
            HStack {
                Button(action: {
                    self.onDissmis()
                    }) { Text("取消")}.padding(20)
                Spacer()
            }

            VStack(alignment: .leading, spacing: 20) {
                Text("习惯名称").font(.system(size: 28))
                TextField("习惯名", text: self.$newItemTitle) {
                    print(self.newItemTitle)
                }
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom, 30)

                Text("图标").font(.system(size: 28))
                HStack(spacing: 10) {
                    ForEach(0 ..< IconNameArray.count) { index in
                        Button(action: {
                            self.selectIconIndex = index
                        }) {
                            Image(systemName: IconNameArray[index])
                                .resizable()
                                .frame(width: 30, height: 30)
                                .padding(3)
                                .foregroundColor(index == self.selectIconIndex ? Color.orange : Color.blue)
                        }
                    }
                }
                    .padding(.bottom, 30)
                
                Text("主题色").font(.system(size: 28))
                HStack(spacing: 4) {
                    ForEach(0 ..< UserColorArray.count) { index in
                        Button(action: {
                            self.selectColorIndex = index
                        }) {
                            ZStack {
                                Image(systemName: "circle.fill")
                                    .resizable()
                                    .frame(width: 36, height: 36)
                                    .foregroundColor(index == self.selectColorIndex ? Color.orange : Color.white)
                                
                                Image(systemName: "circle.fill")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(UserColorArray[index])
                            }
                        }
                    }
                }
            }.padding(.leading, 20).padding(.trailing, 20)
            
            Spacer()

            VStack {

                Button(action: {
                    if self.newItemTitle != "" {
                        let iconName = IconNameArray[self.selectIconIndex];
                        let theme = UserColorArray[self.selectColorIndex];

                        self.onSumit(HabitItem(name: self.newItemTitle, iconName: iconName, theme: theme))
                    }
                }) {
                    Text("新增").frame(minWidth: 0, maxWidth: .infinity)
                }
                    .accentColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }.padding(.leading, 20).padding(.trailing, 20)

            Spacer(minLength: 20)
        }
    }
}
