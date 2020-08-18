//
//  PreviewCSV.swift
//  TesseractForiPhone
//
//  Created by プログラム開発用パソコン02 on 2020/08/13.
//  Copyright © 2020 wings. All rights reserved.
//

import UIKit

class PreviewCSVViewController: UIViewController {
    
    // AnalyzeImage画面から受け取った、結果を保存するCSVファイルのパスを格納しておくための変数
    var resultOfCSVPath = ""
    
    
    //@IBOutlet weak var drawResultLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("AnalyzeImageViewControllerから受け取ったパスは、、、",resultOfCSVPath)
        
        print("そのファイルの中身は、、、", readFile(readFilename: resultOfCSVPath))
        
        //drawResultLabel.text = readFile(readFilename: resultOfCSVPath)
        
        
    }
    
    // デバイス上の"readFilename"のファイルの内容を読み取り、内容を文字列型で返す。
    func readFile(readFilename:String)->String{
         var contentOfFile = ""
         if let documentDirectoryFileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last{
             // ディレクトリのパスにファイル名をつなげてファイルのフルパスを作る
             let targetTextFilePath = documentDirectoryFileURL.appendingPathComponent(readFilename)
              
             //print("書き込むファイルのパス: \(targetTextFilePath)")
             //writedFilePath = targetTextFilePath.absoluteString
             
             do {
                 //try initialText.write(to: targetTextFilePath, atomically: true, encoding: String.Encoding.utf8)
                 contentOfFile = try String(contentsOf: targetTextFilePath, encoding: .utf8)
             } catch let error as NSError {
                 print("failed to write: \(error)")
             }
         }
         return contentOfFile
     }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
