//
//  ImageCategory.swift
//  ImageRecognizer
//
//  Created by TakayukiHARA on 2017/07/30.
//  Copyright © 2017年 Hispot Co., LTD. All rights reserved.
//

import Foundation
import ImageRecognition

enum ImageCategory: Int {
    case all, book, cd, dvd, game, software, food
    
    func toString() -> String {
        switch self {
        case .all:      return "すべて"
        case .book:     return "書籍"
        case .cd:       return "CD"
        case .dvd:      return "DVD"
        case .game:     return "ゲームソフト"
        case .software: return "PCソフト"
        case .food:     return "食品"
        }
    }
    
    func toCategory() -> String {
        switch self {
        case .all:      return RECOG_ALL
        case .book:     return RECOG_BOOK
        case .cd:       return RECOG_CD
        case .dvd:      return RECOG_DVD
        case .game:     return RECOG_GAME
        case .software: return RECOG_SOFTWARE
        case .food:     return RECOG_FOOD
        }
    }
    
    static let count: Int = {
        var i = 0
        while let _ = ImageCategory(rawValue: i) { i += 1 }
        return i
    }()
    
}
