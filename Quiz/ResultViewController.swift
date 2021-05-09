//
//  ResultViewController.swift
//  Quiz
//
//  Created by litech on 2015/02/10.
//  Copyright (c) 2015年 LifeisTech. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    var correctAnswer:Int = 0
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var resultLabel2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        resultLabel.text = "10問中\(correctAnswer)問正解！"
        
        
        if correctAnswer == 10{
            resultLabel2.text = "生粋のアメリカ人！"
        }else if correctAnswer >= 8{
            resultLabel2.text = "アメリカ上級者！"
        }else if correctAnswer >= 5{
            resultLabel2.text = "そこそこ詳しい．．．"
        }else if correctAnswer >= 3{
            resultLabel2.text = "一般的な人ですね"
        }else{
            resultLabel2.text = "まだまだだね．．．"
        }
            
        

    }
    
}
