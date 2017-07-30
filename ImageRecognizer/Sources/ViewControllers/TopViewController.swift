//
//  TopViewController.swift
//  ImageRecognizer
//
//  Created by TakayukiHARA on 2017/07/29.
//  Copyright © 2017年 Hispot Co., LTD. All rights reserved.
//

import UIKit

class TopViewController: UIViewController {

    @IBOutlet weak var targetImage: UIImageView!
    @IBOutlet weak var recognitionButton: UIButton!
    @IBOutlet weak var categoryPicker: UIPickerView!
 
    @IBAction func didPushPhotoButton(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            let picker = UIImagePickerController()
            picker.modalPresentationStyle = UIModalPresentationStyle.popover
            picker.delegate = self
            picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            self.present(picker, animated: true, completion: nil)
        }
    }

    @IBAction func didPushCameraButton(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            let picker = UIImagePickerController()
            picker.modalPresentationStyle = UIModalPresentationStyle.fullScreen
            picker.delegate = self
            picker.sourceType = UIImagePickerControllerSourceType.camera
            self.present(picker, animated: true, completion: nil)
        }
    }

    @IBAction func didPushRecognitionButton(_ sender: Any) {
        performSegue(withIdentifier: R.segue.topViewController.toResultSegue.identifier, sender: sender)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryPicker.delegate = self
        categoryPicker.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == R.segue.topViewController.toResultSegue.identifier {
            let next = segue.destination as! ResultViewController
            
            next.image = targetImage.image
            next.category = ImageCategory(rawValue: categoryPicker.selectedRow(inComponent: 0))!
        }
    }
}

extension TopViewController: UINavigationControllerDelegate {
    // MARK: - UINavigationControllerDelegate
}

extension TopViewController: UIImagePickerControllerDelegate {
    // MARK: - UIImagePickerControllerDelegate

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            targetImage.image = pickedImage
        }
        picker.dismiss(animated: true, completion: nil)

        recognitionButton.isEnabled = true
    }
}

extension TopViewController: UIPickerViewDelegate {
    
    // MARK: - UIPickerViewDelegate
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ImageCategory(rawValue: row)?.toString()
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    }
}

extension TopViewController: UIPickerViewDataSource {
    
    // MARK: - UIPickerViewDataSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ImageCategory.count
    }
    
}
