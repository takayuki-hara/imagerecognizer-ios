//
//  ResultTableViewCell.swift
//  ImageRecognizer
//
//  Created by TakayukiHARA on 2017/07/30.
//  Copyright © 2017年 Hispot Co., LTD. All rights reserved.
//

import UIKit
import Kingfisher

class ResultTableViewCell: UITableViewCell {

    // MARK: - Properties
    var resultData: RecognitionResult? = nil
    
    // MARK: - IBOutlet
    @IBOutlet weak var objectImage: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var itemIdLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!

    // MARK: - IBAction
    @IBAction func didPushStoreButton(_ sender: Any) {
        if let url = URL(string: (resultData?.siteUrl)!), UIApplication.shared.canOpenURL(url){
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:])
            } else {
                // Fallback on earlier versions
            }
        }
    }

    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    // MARK: - Public Methods
    func setResult(_ result: RecognitionResult) {
        let url = URL(string: result.imageUrl)
        objectImage.kf.setImage(with: url)

        itemNameLabel.text = result.detail["itemName"] as? String

        scoreLabel.text = "Score: " + result.score
        itemIdLabel.text = "ItemID: " + result.itemId
        categoryLabel.text = "Category: " + result.category

        self.resultData = result
    }
}
