//
//  ViewController.swift
//  ImageRecognizer
//
//  Created by TakayukiHARA on 2017/07/29.
//  Copyright © 2017年 Hispot Co., LTD. All rights reserved.
//

import UIKit
import ImageRecognition

class ViewController: UIViewController {

    var ret: ImageRecognitionResultData = [:]

    @IBAction func didPushButton(_ sender: Any) {
        recognition()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func recognition() {
        let reco = ImageRecognition()
        let param = RequestParams()
        param.apiKey = "6d396a486a77776f36733734726e6c30354b4c4b6a63564b326f5536734b51594356414b4149374f676a2e"
        param.recognitionType = RECOG_ALL   // カテゴリを絞ると精度が増しそう
        param.image = UIImage(named:"test_image")
        do {
            try self.ret = reco.recognize(param)
        } catch let error {
            print(error)
            return
        }
        if ret.candidateDataList == nil {
            print("結果を取得できませんでした。")
            return
        }
        for value in ret.candidateDataList {
            let data = value as! ImageRecognitionCandidateData
            print(String(data.score))
            print(data.itemId)
            print(data.category)
            print(data.imageUrl)
            print(data.detailData)
            print(data.siteDataList)
            print(data.relatedContentDataList)
        }
    }

}

