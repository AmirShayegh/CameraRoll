//
//  ViewController.swift
//  CameraRoll
//
//  Created by amirshayegh on 11/09/2018.
//  Copyright (c) 2018 amirshayegh. All rights reserved.
//

import UIKit
import Photos
import CameraRoll

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func chooseVideos(_ sender: UIButton) {
        let cr = CameraRoll()
        cr.present(in: self, mode: .Video) { (assets) in
            if let assets = assets, let first = assets.first {
                DispatchQueue.main.async {
                    AssetManager.sharedInstance.getImageFromAsset(phAsset: first) { (image) in
                        self.imageView.image = image
                    }
                }
            }
        }

    }
    @IBAction func choosePhotos(_ sender: UIButton) {
        let cr = CameraRoll()
        cr.present(in: self, mode: .Image) { (assets) in
            if let assets = assets, let first = assets.first {
                DispatchQueue.main.async {
                    AssetManager.sharedInstance.getImageFromAsset(phAsset: first) { (image) in
                        self.imageView.image = image
                    }
                }
            }
        }
    }

}

