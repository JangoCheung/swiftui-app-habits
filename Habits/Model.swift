//
//  Model.swift
//  Habits


import Foundation
import SwiftUI

// 一个函数，返回了一个闭包，用来持有 id，做到自增长 id
func _generateID() -> () -> Int {
    var id = 0
    
    return {
        id += 1
        return id
    }
}

var generatteID = _generateID()

public let UserColorArray = [
  Color(red:75 / 255, green:166 / 255, blue: 239 / 255),
  Color(red:161 / 255, green:206 / 255, blue: 97 / 255),
  Color(red:248 / 255, green:214 / 255, blue: 80 / 255),
  Color(red:243 / 255, green:176 / 255, blue: 74 / 255),
  Color(red:238 / 255, green:140 / 255, blue: 111 / 255),
  Color(red:237 / 255, green:113 / 255, blue: 165 / 255),
  Color(red:207 / 255, green:102 / 255, blue: 247 / 255),
  Color(red:77 / 255, green:110 / 255, blue: 247 / 255),
  Color(red:236 / 255, green:107 / 255, blue: 102 / 255)
]

public let IconNameArray: [String] = [
    "alarm",
    "book",
    "pencil",
    "desktopcomputer",
    "gamecontroller",
    "sportscourt",
    "lightbulb"
]

public class HabitItem: Identifiable, ObservableObject {
    var name: String = ""
    var iconName: String = IconNameArray[0]
    var theme: Color = UserColorArray[0]
    var uuid: Int = 0

    @Published var checkList: [Bool] = [false, false, false, false, false, false, false]
    
    init () {
        
    }
    
    init(name: String, iconName: String, theme: Color) {
        self.name = name
        self.iconName = iconName
        self.theme = theme
        self.uuid = generatteID()
    }
}
