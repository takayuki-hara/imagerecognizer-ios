//
//  RecognitionResult.swift
//  ImageRecognizer
//
//  Created by TakayukiHARA on 2017/07/30.
//  Copyright © 2017年 Hispot Co., LTD. All rights reserved.
//

import Foundation

class RecognitionResult {

    var score = ""
    var itemId = ""
    var category = ""
    var imageUrl = ""
    var detail: [AnyHashable: Any] = [:]
    // サイトデータは複数あるが一つだけ抽出する
    var siteTitle = ""
    var siteImageUrl = ""
    var siteUrl = ""
}
