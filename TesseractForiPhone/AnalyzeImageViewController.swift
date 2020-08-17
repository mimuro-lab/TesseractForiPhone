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

    // 出力結果を保存しておくCSVファイルのパス（PreviewCSV画面へ渡す変数）
    var resultOfAnalyze: String = "none"

     override func viewDidLoad() {
        super.viewDidLoad()
        
        let fileName = "sample.png"
        guard let image = UIImage(named: fileName) else { return }

        swiftyTesseract.performOCR(on: image) { recognizedString in
            guard let text = recognizedString else { return }
            //print("\(text)")
        }
        
        print("AnalyzeImageViewControllerから渡す変数は、、、", resultOfAnalyze)
        
        //　結果を格納しておくresultOfAnalyzeの中身を読み取る（後で消す）
        // resultOfAnalyze.csvのパスを指定。
        guard let fileURL = Bundle.main.url(forResource: "resultOfAnalyze", withExtension: "csv")  else {
            fatalError("ファイルが見つからない")
        }
         
        // 中身を読み取る
        guard let fileContents = try? String(contentsOf: fileURL) else {
            fatalError("ファイル読み込みエラー")
        }
        
        print(fileContents)
    }
    
    // PreviewCSV画面へ変数を渡すための関数
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "toPreviewCSV"{
            let nextView = segue.destination as! PreviewCSVViewController
            nextView.resultOfAnlyze = resultOfAnalyze
        }
    }
    
}
