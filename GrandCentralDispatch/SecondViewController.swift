//
//  SecondViewController.swift
//  GrandCentralDispatch
//
//  Created by wtildestar on 18/11/2019.
//  Copyright © 2019 wtildestar. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    // загрузка изображения с урла
    fileprivate var imageURL: URL?
    fileprivate var image: UIImage? {
        get {
            return imageView.image
        }
        
        set {
            activityIndicator.stopAnimating()
            activityIndicator.isHidden = true
            imageView.image = newValue
            imageView.sizeToFit() // режим отображения
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchImage()
    }
    fileprivate func fetchImage() {
        imageURL = URL(string: "https://i1.sndcdn.com/artworks-000583440557-af942c-t500x500.jpg")
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        guard let url = imageURL, let imageData = try? Data(contentsOf: url) else { return }
        self.image = UIImage(data: imageData)
    }
}


