//
//  GameViewController.swift
//  Assignment1_IOS_NBajgai
//
//  Created by Bajgai Navin on 5/1/19.
//  Copyright © 2019 Bajgai Navin. All rights reserved.
//

import UIKit
import AVFoundation

class GameViewController: UIViewController {
    var playerName:String = ""
    var playerYear:String = ""
    var questionPos:Int = 1
    var correctAnswer:String = ""
    var noOfQuestion:Int = 0
    var questionNo:Int = 0
    var score:Int = 0
    var streak:Int = 0
    var noOfLifelines:Int = 0
    var audioPlayer : AVAudioPlayer!

    let qaLibrary = QALibrary()
    
    
    @IBOutlet weak var answerChoice3Btn: UIButton!
    @IBOutlet weak var answerChoice2Btn: UIButton!
    @IBOutlet weak var answerChoice1Btn: UIButton!
    @IBOutlet weak var playerNameLbl: UITextField!
    @IBOutlet weak var scoreLbl: UITextField!
    @IBOutlet weak var streakLbl: UITextField!
    @IBOutlet weak var questionNoLbl: UILabel!
    @IBOutlet weak var displayQuestionLbl: UILabel!
    @IBOutlet weak var lifeline1: UIImageView!
    @IBOutlet weak var lifeline3: UIImageView!
    @IBOutlet weak var lifeline2: UIImageView!
    @IBOutlet weak var gameOverImgView: UIImageView!
    @IBOutlet weak var viewLBBtn: UIButton!
    @IBOutlet weak var resultLbl: UILabel!
    @IBOutlet weak var starImgView: UIImageView!
    @IBOutlet weak var congratsImgView: UIImageView!
    
    //on the click of first answer button, check if it's a correct answer or not.
    @IBAction func answerChoice1Btn(_ sender: UIButton)
    {
        if(answerChoice1Btn.title(for: .normal) == correctAnswer)
        {
            rightAnswerBtnOnClick()
        }
        else {
            wrongAnswerBtnOnClick()
        }
    }
    
    //on the click of second answer button, check if it's a correct answer or not.
    @IBAction func answerChoice2Btn(_ sender: Any)
    {
        //questionNoLbl.text = "answer 2 clicked!"
        if(answerChoice2Btn.title(for: .normal) == correctAnswer)
        {
            rightAnswerBtnOnClick()
        }
        else {
            wrongAnswerBtnOnClick()
        }
    }
    
    //on the click of third answer button, check if it's a correct answer or not.
    @IBAction func answerChoice3Btn(_ sender: Any)
    {
        //questionNoLbl.text = "answer 3 clicked!"
        if(answerChoice3Btn.title(for: .normal) == correctAnswer)
        {
            rightAnswerBtnOnClick()
        }
        else {
            wrongAnswerBtnOnClick()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Game View"
        playSound(soundFileName: "background_music")
        
        print("from gameVC: " + playerName + ", " + playerYear)
        playerNameLbl.text = playerName
        scoreLbl.text = "\(score)"
        streakLbl.text = "\(streak)"
        
        updateQuestion()    //update the question on a view load
        questionNoLbl.text = "Question \(questionPos) out of 10"
    }
    
    //function for updating the question into a screen.
    func updateQuestion() ->Void
    {
        //if all questions have been displayed, then it means the game is over.
        if(noOfQuestion == 10)
        {
            playSound(soundFileName: "clapping")
            
            questionPos = 10
            answerChoice1Btn.isHidden =  true
            answerChoice2Btn.isHidden =  true
            answerChoice3Btn.isHidden =  true
            displayQuestionLbl.isHidden = true
            questionNoLbl.isHidden = true
            congratsImgView.isHidden = false
            viewLBBtn.isHidden = false
            starImgView.isHidden = false
            
        }
            
        //if the game is not finished yet, keep updating the question
        else
        {
            noOfQuestion += 1
            displayQuestionLbl.text = qaLibrary.getQuestion(questionPos: questionNo)
            answerChoice1Btn.setTitle(qaLibrary.getAnswerChoice1(answerChoicePos: questionNo), for: .normal)
            answerChoice2Btn.setTitle(qaLibrary.getAnswerChoice2(answerChoicePos: questionNo), for: .normal)
            answerChoice3Btn.setTitle(qaLibrary.getAnswerChoice3(answerChoicePos: questionNo), for: .normal)
            
            //animation
            //UIView.animate(withDuration: 1, animations: {self.answerChoice1Btn.setTitleColor(UIColor.red, for: .normal)})
            
            correctAnswer = qaLibrary.getCorrectAnswer(correctAnswerPos: questionNo)
            questionNo += 1
        }
    }
    
    //function for handling the event when the right answer button is clicked.
    func rightAnswerBtnOnClick()->Void
    {
        playSound(soundFileName: "yes")
        resultLbl.text = "Correct!"
        updateQuestion()
        
        score += 100
        scoreLbl.text = "\(score)"
        
        streak += 1
        streakLbl.text = "\(streak)"
        
        if(questionPos < 10)
        {
            questionPos += 1
        }
        else {
            questionPos = 10
        }
        questionNoLbl.text = "Question \(questionPos) out of 10"
        
        if(score == 1000)
        {
            displayQuestionLbl.text = "congatulations"
            writeGameDataToFile(name: playerName, score: score, streak: streak)     //write game stats to a file when the game finishes.
        }
    }
    
    //function for handling the event when the wrong answer button is clicked.
    func wrongAnswerBtnOnClick()->Void
    {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)    //vibrate the phone
        playSound(soundFileName: "no")
        noOfLifelines += 1  //no of lifelines decreases
        streak = 0          //streak set to zero
        streakLbl.text = "\(streak)"
        
        if(noOfLifelines == 1)
        {
            lifeline1.isHidden = true
            resultLbl.text = "Wrong!"
        }
        else if(noOfLifelines == 2)
        {
            lifeline2.isHidden = true
            resultLbl.text = "Wrong!"
        }
        else if (noOfLifelines == 3)
        {
            //once all 3 lifelines are used, the game finishes and the game stats is written into a file.
            writeGameDataToFile(name: playerName, score: score, streak: streak)
            
            playSound(soundFileName: "game_over")
            lifeline3.isHidden = true
            resultLbl.text = "Wrong and Game Over"
            resultLbl.textColor = UIColor.red
            
            questionNoLbl.isHidden = true
            displayQuestionLbl.isHidden = true
            answerChoice1Btn.isHidden = true
            answerChoice2Btn.isHidden = true
            answerChoice3Btn.isHidden = true
            
            gameOverImgView.isHidden = false
            viewLBBtn.isHidden = false
        }
    }
    
    //function for playing the in-game sound
    func playSound(soundFileName: String)
    {
        let soundURL = Bundle.main.url(forResource: soundFileName, withExtension: "mp3")
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
            audioPlayer.play()
        }
        catch {
            print(error)
        }
        print("sound played!")
    }
    
    //function for writting the game stats into a text file once the game has finished.
    func writeGameDataToFile(name:String, score:Int, streak:Int)
    {
        let outString = "\(name),\(score),\(streak)"      //the game data to be saved in a text file.
        do {
            let dir: URL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last! as URL      //getting the directory
            let url = dir.appendingPathComponent("playerStats2.txt")
            print("file Path: \(url)")
            
            try outString.appendLineToURL(fileURL: url as URL)      //appending the game stats to the exisiting data in a text file as a new line
            _ = try String(contentsOf: url as URL, encoding: String.Encoding.utf8)
        }
        catch {
            print("Could not write to file")
        }
    }
}

//extension for appending the data into a existing text file
extension String {
    func appendLineToURL(fileURL: URL) throws {
        try (self + "\n").appendToURL(fileURL: fileURL)
    }
    
    func appendToURL(fileURL: URL) throws {
        let data = self.data(using: String.Encoding.utf8)!
        try data.append(fileURL: fileURL)
    }
}

extension Data {
    func append(fileURL: URL) throws {
        if let fileHandle = FileHandle(forWritingAtPath: fileURL.path) {
            defer {
                fileHandle.closeFile()
            }
            fileHandle.seekToEndOfFile()
            fileHandle.write(self)
        }
        else {
            try write(to: fileURL, options: .atomic)
        }
    }
}
