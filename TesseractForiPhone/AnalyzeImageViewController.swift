//
//  AnalyzeImage.swift
//  TesseractForiPhone
//
//  Created by プログラム開発用パソコン02 on 2020/08/13.
//  Copyright © 2020 wings. All rights reserved.
//

import UIKit
import SwiftyTesseract
import Foundation

class AnalyzeImageViewController: UIViewController {

    let swiftyTesseract = SwiftyTesseract(language: .japanese)

    // 出力結果を保存しておくCSVファイルのパス（PreviewCSV画面へ渡す変数）
    var resultOfCSVPath: String = "none"

     override func viewDidLoad() {
        super.viewDidLoad()
        
        let fileName = "sample.png"
        guard let image = UIImage(named: fileName) else { return }

        var resultOfContent = ""
        
        swiftyTesseract.performOCR(on: image) { recognizedString in
            guard let text = recognizedString else { return }
            //print("\(text)")
            resultOfContent = text
        }
        
        // 書き込むCSVファイルの名前
        let filename = "resultOfAnalyze.csv"
        resultOfCSVPath = filename
        
        print("AnalyzeImageViewControllerから渡す変数は、、、", resultOfCSVPath)
        
        // 読み込んだ内容を格納する変数
        // CSVファイルを作り、認識結果を書き込む。
        createFile(makeFileName: filename, writingText: resultOfContent)
        // filenameの内容を読みとり、変数:contentに代入する
        guard let content = readFile(readFilename: filename) else{
            return
        }
        print("認識結果を、", resultOfCSVPath ,"に書き込みました。",content)
        
    }
    
    // "makeFileName"の名前のファイルをデバイス上に作り、"writeingText"の内容を書き込む。
    func createFile(makeFileName:String, writingText:String) {
         
        // DocumentディレクトリのfileURLを取得
        if let documentDirectoryFileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last {
         
            // ディレクトリのパスにファイル名をつなげてファイルのフルパスを作る
            let targetTextFilePath = documentDirectoryFileURL.appendingPathComponent(makeFileName)
             
            //print("書き込むファイルのパス: \(targetTextFilePath)")
            
            do {
                try writingText.write(to: targetTextFilePath, atomically: true, encoding: String.Encoding.utf8)
            } catch let error as NSError {
                print("failed to write: \(error)")
            }
        }
    }
    
    // デバイス上の"readFilename"のファイルの内容を読み取り、内容を文字列型で返す。
    func readFile(readFilename:String)->String?{
        
        // ファイルパスを取得する
        guard let documentDirectoryFileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last
            else {
            // ファイルパスが見つからなかったら、nilを返す
            print("")
            return nil
        }
        
        // ディレクトリのパスにファイル名をつなげてファイルのフルパスを作る
        let targetTextFilePath = documentDirectoryFileURL.appendingPathComponent(readFilename)
         
        //print("書き込むファイルのパス: \(targetTextFilePath)")
        //writedFilePath = targetTextFilePath.absoluteString

        do {
            //try initialText.write(to: targetTextFilePath, atomically: true, encoding: String.Encoding.utf8)
            // ファイルの中身が読み取れたら、内容をリターンする
            return  try String(contentsOf: targetTextFilePath, encoding: .utf8)
        } catch let error as NSError {
            // ファイルの中身が読み取れなかったら、nilを返す
            print("failed to read \(error)")
            return nil
        }
    }
    
    // PreviewCSV画面へ変数を渡すための関数
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "toPreviewCSV"{
            let nextView = segue.destination as! PreviewCSVViewController
            nextView.resultOfCSVPath = resultOfCSVPath
        }
    }
    
}
