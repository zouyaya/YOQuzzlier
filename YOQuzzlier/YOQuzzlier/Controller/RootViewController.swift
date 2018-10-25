//
//  RootViewController.swift
//  YOQuzzlier
//
//  Created by yangou on 2018/10/23.
//  Copyright © 2018年 hello. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    
    var questionLabl : UILabel!
    var correctButton : UIButton!
    var fauseButton : UIButton!
    var progressView : UIView!
    var ScoreLabel : UILabel!
    var progressLabel : UILabel!
    let allQuestions = QuestionList()
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    var score : Int = 0
  

    override func viewDidLoad() {
        super.viewDidLoad()

        initiliazeView();
        
    }
    
    
    func initiliazeView(){
        
       
        
        let firstQuestion = allQuestions.list[0];
        
        self.view.backgroundColor = UIColor.green;
        questionLabl = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.width))
        questionLabl.textColor = UIColor.red
        questionLabl.numberOfLines = 0;
        questionLabl.textAlignment = NSTextAlignment.center
        questionLabl.text = firstQuestion.question
        questionLabl.font = UIFont.systemFont(ofSize: 15);
        self.view .addSubview(questionLabl)
        
        
        correctButton = UIButton(frame: CGRect(x: 100, y: 300, width: 80, height: 40))
        correctButton.layer.cornerRadius = 3;
        correctButton.clipsToBounds = true;
        correctButton.tag = 1;
        correctButton.backgroundColor = UIColor.blue
        correctButton .setTitleColor(UIColor.red, for: .normal);
        correctButton .setTitle("对", for: .normal)
        correctButton .addTarget(self, action: #selector(pressRight), for: .touchUpInside)
        self.view .addSubview(correctButton)
        
        fauseButton = UIButton(frame: CGRect(x: 200, y: 300, width: 80, height: 40))
        fauseButton.layer.cornerRadius = 3;
        fauseButton.clipsToBounds = true;
        fauseButton.tag = 2;
        fauseButton.backgroundColor = UIColor.blue
        fauseButton .setTitleColor(UIColor.red, for: .normal);
        fauseButton .setTitle("错", for: .normal)
        fauseButton .addTarget(self, action: #selector(pressRight), for: .touchUpInside)
        self.view .addSubview(fauseButton)
        
        
        progressLabel = UILabel(frame: CGRect(x: 10, y: self.view.frame.size.height - 50, width: 100, height: 30))
        progressLabel.textColor = UIColor.white
        progressLabel.font = UIFont.systemFont(ofSize: 15);
        progressLabel.text = "x/13"
        self.view .addSubview(progressLabel)
        
        
        progressView = UIView(frame: CGRect(x: 0, y: self.view.frame.size.height - 20, width: 10, height: 20))
        progressView.backgroundColor = UIColor.yellow
        self.view .addSubview(progressView)
        
        
        ScoreLabel = UILabel(frame: CGRect(x: self.view.frame.size.width - 100, y: self.view.frame.size.height - 50, width: 100, height: 20))
        ScoreLabel.textColor = UIColor.white
        ScoreLabel.font = UIFont.systemFont(ofSize: 15);
        ScoreLabel.textAlignment = NSTextAlignment.right
        ScoreLabel.text = "分数 3";
        self.view .addSubview(ScoreLabel);
        
    }
    
    @objc func pressRight(button:UIButton){
        
        
        if button.tag == 1 {
            
            pickedAnswer = true;
        }else{
            
            pickedAnswer = false
        }
        
        if questionNumber < 12 {
           
            checkAnswer()
            questionNumber += 1
            print(questionNumber)
            nextQuestion()
            
        }else{
            
            let alert = UIAlertController(title: "Quiz ended", message: "Restart the game?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { (UIActionAlert) in
                self.startOver()
            })
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
            
        }
        
        
    }
    
    
    func checkAnswer() {
        
        let correctionAnswer = allQuestions.list[questionNumber].correct;
        if correctionAnswer == pickedAnswer {
            
            score += 10;
            print("true");
        }else{
            
            print("faulse");
        }

    }
    
    func nextQuestion() {
        
        questionLabl.text = allQuestions.list[questionNumber].question;
         updateUI()
        
    }
    
    func  updateUI() {
        
        ScoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionNumber + 1)/13"
        progressView.frame.size.width = (view.frame.size.width/13) * CGFloat( questionNumber + 1 )
    }
    
    func startOver() {
        questionNumber = 0
        nextQuestion()
        progressLabel.text = "\(questionNumber + 1)/13"
        score = 0
        ScoreLabel.text = String("Score: 0" )
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
