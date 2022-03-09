//
//  ViewController.swift
//  book_demo1
//
//  Created by ldd on 2022/2/16.
//

import UIKit

class ViewController: UIViewController {
    let questions: [String] = ["1+1", "1+2", "1+3"]
    let answers: [String] = ["2", "3", "4"]
    var currentQuestionIndex: Int = 0

//    @IBOutlet var questionLable: UILabel!
    
    @IBOutlet var currentQuestionLabel: UILabel!
    @IBOutlet var nextQuestionLabel: UILabel!
    
    @IBOutlet var answerLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let question = questions[currentQuestionIndex]
        currentQuestionLabel.text = question
    }

//    下一个问题
    @IBAction func showNextQuestion(sender: AnyObject) {
        currentQuestionIndex += 1
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        let questtion: String = questions[currentQuestionIndex]
        nextQuestionLabel.text = questtion
        answerLabel.text = "???"
        animatedLabelTransitions()
    }

//    显示答案
    @IBAction func showAnswer(sender: AnyObject) {
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer
    }
    
    
    //处理动画
    func animatedLabelTransitions () {
//        let animationClosure = { () -> Void in
//            self.questionLable.alpha = 1
//        }
//
//        // 动画
//        UIView.animate(withDuration: 0.5, animations: animationClosure)
        
        //上面可以简写成
        UIView.animate(withDuration: 0.5, animations: {
            self.currentQuestionLabel.alpha = 1
            self.nextQuestionLabel.alpha = 0
        })
        
    }
    
    /// 展示组件的时候将问题标签设置为0
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nextQuestionLabel.alpha = 0
    }
}
