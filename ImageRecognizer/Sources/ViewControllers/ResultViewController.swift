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

    var image: UIImage?
    var category = ImageCategory.all
    var ret: ImageRecognitionResultData = [:]
    var results: [RecognitionResult] = []
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        recognition()

        // xibをセルとして登録する
        tableView.register(R.nib.resultTableViewCell(), forCellReuseIdentifier: R.reuseIdentifier.resultCell.identifier)
        self.tableView.delegate = self
        self.tableView.dataSource = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    private func recognition() {
        print(category.toString())
        let reco = ImageRecognition()
        let param = RequestParams()
        param.apiKey = "6d396a486a77776f36733734726e6c30354b4c4b6a63564b326f5536734b51594356414b4149374f676a2e"
        param.recognitionType = category.toCategory() //RECOG_ALL
        param.image = UIImage(named:"test_image")
        do {
            try self.ret = reco.recognize(param)
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
        for value in ret.candidateDataList {
            let data = value as! ImageRecognitionCandidateData
            let result = RecognitionResult()
            result.score = String(data.score)
            result.itemId = data.itemId
            result.category = data.category
            result.imageUrl = data.imageUrl
            result.detail = data.detailData

            //for item in data.detailData {
            //    print(item.key, ":", item.value)
            //}
            //print(data.detailData)
            //print(data.siteDataList)
            for item in data.siteDataList {
                let site = item as! ImageRecognitionSiteData
                result.siteTitle = site.imageUrl
                result.siteImageUrl = site.imageUrl
                result.siteUrl = site.url
                break // 一周で良い
            }
            results.append(result)
        }
        // データが取得できたらリロード
        tableView.reloadData()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

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
