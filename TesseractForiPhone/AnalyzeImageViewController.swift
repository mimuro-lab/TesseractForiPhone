//
//  AnalyzeImage.swift
//  TesseractForiPhone
//
//  Created by プログラム開発用パソコン02 on 2020/08/13.
//  Copyright © 2020 wings. All rights reserved.
//

import UIKit
import SwiftyTesseract

class AnalyzeImageViewController: UIViewController {

    let swiftyTesseract = SwiftyTesseract(language: .japanese)


     override func viewDidLoad() {
        super.viewDidLoad()
        
        let fileName = "sample.png"
        guard let image = UIImage(named: fileName) else { return }

        swiftyTesseract.performOCR(on: image) { recognizedString in
            guard let text = recognizedString else { return }
            print("\(text)")

        }
    }
}
