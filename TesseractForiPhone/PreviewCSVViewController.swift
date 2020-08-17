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
    var resultOfAnlyze = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("AnalyzeImageViewControllerから受け取ったパスは、、、",resultOfAnlyze)
        
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
