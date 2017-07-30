//
//  TopViewController.swift
//  ImageRecognizer
//
//  Created by TakayukiHARA on 2017/07/29.
//  Copyright © 2017年 Hispot Co., LTD. All rights reserved.
//

import UIKit
import ImageRecognition

class TopViewController: UIViewController {

    var ret: ImageRecognitionResultData = [:]

    @IBOutlet weak var targetImage: UIImageView!
    @IBAction func didPushButton(_ sender: Any) {
        //recognition()
        
//        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
//            let picker = UIImagePickerController()
//            picker.modalPresentationStyle = UIModalPresentationStyle.popover
//            picker.delegate = self
//            picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
//            self.present(picker, animated: true, completion: nil)
//        }
//        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            let picker = UIImagePickerController()
            picker.modalPresentationStyle = UIModalPresentationStyle.fullScreen
            picker.delegate = self
            picker.sourceType = UIImagePickerControllerSourceType.camera
            self.present(picker, animated: true, completion: nil)
        }
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

extension TopViewController: UINavigationControllerDelegate {
    
}

extension TopViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            // pickedImageが読み込まれた画像なので、あとはお好きに
            print("aaaaaaaaaaa")
            targetImage.image = pickedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
}
