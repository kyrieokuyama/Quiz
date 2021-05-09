//
//  QuizViewController.swift
//  Quiz
//
//  Created by litech on 2015/02/10.
//  Copyright (c) 2015年 LifeisTech. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    //クイズを格納する配列
    var quizArray = [[Any]]()
    
    //正解数
    var correctAnswer: Int = 0
    
    //クイズを表示するTextView
    @IBOutlet var quizTextView: UITextView!
    
    //選択肢のボタン
    @IBOutlet var choiceButtons1: UIButton!
    @IBOutlet var choiceButtons2: UIButton!
    @IBOutlet var choiceButtons3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //------------------------ここから下にクイズを書く------------------------//
        quizArray.append(["独立100周年を記念した自由の女神像は，何年に建てられた？", "1930年", "1886年", "1972年", 2])
        quizArray.append(["スターバックス発祥の地は？", "シカゴ", "シアトル", "ニューヨーク", 2])
        quizArray.append(["アメリカの国旗の色は？","青，赤","赤，白","青，赤，白",3])
        quizArray.append(["アメリカの国鳥は？", "Bald Eagle", "Golden Eagle", "Brown Eagle", 1])
        quizArray.append(["ニューヨークでは，Slice of pieと言うと一般的に何を指すでしょう", "アップルパイ", "チーズケーキ", "ピザ", 3])
        quizArray.append(["バットマンでお馴染み，ゴッサムシティはどこがモデルになっている？", "ニューヨーク", "デトロイト", "シカゴ", 1])
        quizArray.append(["Can I borrow a buck?とは何について言っているか", "dollar", "quarter", "penny", 1])
        quizArray.append(["Twitterで最も多くのフォロワーがいるのは誰？", "レディ・ガガ", "ジャスティン・ビーバー", "アリアナ・グランデ", 2])
        quizArray.append(["カルフォルニアのRed Bridgeと言えば？", "George Washington Bridge", "San Francisco Oakland Bay Bridge", "Golden Gate Bridge", 3])
        quizArray.append(["アメリカのDisney Worldは何州にある？", "California", "Texas", "Florida", 3])
        //------------------------ここから上にクイズを書く------------------------//
        
        //quizArrayの中身をシャッフルする
        quizArray.shuffle()

        choiceQuiz()
    }
    
    func choiceQuiz() {
        quizTextView.text = quizArray[0][0] as? String
        
        //選択肢のボタンにそれぞれ選択肢のテキストをセット
        choiceButtons1.setTitle(quizArray[0][1] as? String, for: .normal)
        choiceButtons2.setTitle(quizArray[0][2] as? String, for: .normal)
        choiceButtons3.setTitle(quizArray[0][3] as? String, for: .normal)
    }
    
    @IBAction func choiceAnswer(sender: UIButton) {
        if quizArray[0][4] as! Int == sender.tag {
            //正解数を増やす
            correctAnswer+=1
        }
        
        quizArray.remove(at: 0)
        //解いた問題数の合計が予め設定していた問題数に達したら結果画面へ
        if quizArray.count == 0 {
            performSegueToResult()
        } else {
            choiceQuiz()
        }
    }
    
    func performSegueToResult() {
        performSegue(withIdentifier: "toResultView", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toResultView") {
            
            let resultView = segue.destination as! ResultViewController
            resultView.correctAnswer = self.correctAnswer
        }
    }
}


