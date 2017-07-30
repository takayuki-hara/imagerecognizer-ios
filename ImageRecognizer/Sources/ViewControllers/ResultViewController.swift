//
//  ResultViewController.swift
//  ImageRecognizer
//
//  Created by TakayukiHARA on 2017/07/30.
//  Copyright © 2017年 Hispot Co., LTD. All rights reserved.
//

import UIKit
import ImageRecognition

class ResultViewController: UIViewController {

    // MARK: - Properties
    var selectedImage: UIImage?
    var category = ImageCategory.all
    var results: [RecognitionResult] = []

    // MARK: - IBOutlet
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var recognitionIdLabel: UILabel!

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // xibをセルとして登録する
        tableView.register(R.nib.resultTableViewCell(), forCellReuseIdentifier: R.reuseIdentifier.resultCell.identifier)
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    override func viewDidAppear(_ animated: Bool) {
        // 画像認識を実行
        recognition()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Private Methods
    private func recognition() {
        print(category.toString())

        let reco = ImageRecognition()
        let param = RequestParams()
        param.apiKey = "6d396a486a77776f36733734726e6c30354b4c4b6a63564b326f5536734b51594356414b4149374f676a2e"
        param.recognitionType = category.toCategory()
        param.image = selectedImage // UIImage(named:"test_image")

        var ret: ImageRecognitionResultData = [:]
        do {
            try ret = reco.recognize(param)
        } catch let error {
            print(error)
            resultLabel.text = "認識エラー"
            return
        }
        if ret.candidateDataList == nil {
            resultLabel.text = "結果を取得できませんでした。"
            return
        }

        results = []
        resultLabel.text = "結果：\(ret.candidateDataList.count)件"
        recognitionIdLabel.text = "RecognitionID: " + String(ret.recognitionId)
        for value in ret.candidateDataList {
            let data = value as! ImageRecognitionCandidateData
            let result = RecognitionResult()
            result.score = String(data.score)
            result.itemId = data.itemId
            result.category = data.category
            result.imageUrl = data.imageUrl
            result.detail = data.detailData

            // Debug output -----------------
            print("ItemID: ", data.itemId)
            for item in data.detailData {
                print(item.key, ": ", item.value)
            }
            print("-----")
            // ------------------------------

            for item in data.siteDataList {
                let site = item as! ImageRecognitionSiteData
                result.siteTitle = site.imageUrl
                result.siteImageUrl = site.imageUrl
                result.siteUrl = site.url
                break // 先頭のデータだけ格納したいので一周目で抜ける
            }
            results.append(result)
        }

        // データが取得できたらリロード
        tableView.reloadData()
    }
    
}

extension ResultViewController: UITableViewDataSource {
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.resultCell.identifier) as! ResultTableViewCell
        
        // Configure the cell
        cell.setResult(results[indexPath.row])
        
        return cell
    }

}

extension ResultViewController: UITableViewDelegate {
    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140.0
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
