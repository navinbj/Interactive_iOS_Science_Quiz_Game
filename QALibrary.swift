//
//  Q&ALibrary.swift
//  Assignment1_IOS_NBajgai
//
//  Created by Bajgai Navin on 5/2/19.
//  Copyright © 2019 Bajgai Navin. All rights reserved.
//
import Foundation

class QALibrary {
    var questions =  [String]()         //array to store questions
    var answerChoices = [[String]]()    //2D array to store answer choices
    var correctAnswers = [String]()     //array to store the correct answer
    
    //constructor for the class QALibrary
    init()
    {
        //populating the questions to an array
        questions.append("What is the force of an object with a mass of 10kg and an acceleration of 3m/s?")
        questions.append("A golf cart is driven at its top speed of 27 km/h for 10 minutes. How far did the golf cart travel?")
        questions.append("What is the speed of a car that is traveling 10 miles every 5 minutes?")
        questions.append("A hairdryer transfers 4800 Joules of energy in 1 minute. What is the power rating of the hairdryer?")
        questions.append("Calculate the amount of carbon atoms in 6.0 g of carbon. (Ar of C = 12)")
        questions.append("What is the mass of an object with a force of 81N and an acceleration of 3m/s?")
        questions.append("Iain walked from his parents' farm into town at a steady speed of 5km/h. The journey took 3 hours. How far did Iain walk?")
        questions.append("Kelly runs from 4.50pm until 5.20pm at an average speed of 7km/h. How far did she go?")
        questions.append("Calculate the force needed to accelerate a 20 kg cheetah at 10 m/s².")
        questions.append("What is the overall stopping distance of a lorry that has a thinking distance of 12m and a braking distance of 30m?")
        
        //populating the answers choices to a 2D array
        answerChoices.append(["13N", "30N", "7N"])
        answerChoices.append(["37 Km", "2.7 Km", "270 Km"])
        answerChoices.append(["2 m/m", "15 m/m", "50 m/m"])
        answerChoices.append(["60W", "70W", "80W"])
        answerChoices.append(["0.4 mol", "0.5 mol", "0.6 mol"])
        answerChoices.append(["48 Kg", "84 Kg", "27 kg"])
        answerChoices.append(["15 km", "8km", "2km"])
        answerChoices.append(["0.5 hr", "1 hr", "1.5 hr"])
        answerChoices.append(["30N", "200N", "10N"])
        answerChoices.append(["18m", "-18m", "42m"])
        
        //populating the correct answer to an array
        correctAnswers.append("30N")
        correctAnswers.append("270 Km")
        correctAnswers.append("2 m/m")
        correctAnswers.append("80W")
        correctAnswers.append("0.5 mol")
        correctAnswers.append("27 kg")
        correctAnswers.append("15 km")
        correctAnswers.append("0.5 hr")
        correctAnswers.append("200N")
        correctAnswers.append("42m")
    }
    
    //returns the question from an array by its position.
    func getQuestion(questionPos: Int) -> String {
        let question = questions[questionPos]
        return question
    }
    
    //returns the first answer choice from a 2D array by its position
    func getAnswerChoice1(answerChoicePos: Int) -> String {
        let answer = answerChoices[answerChoicePos][0]
        return answer
    }
    
    //returns the second answer choice from a 2D array by its position
    func getAnswerChoice2(answerChoicePos: Int) -> String {
        let answer = answerChoices[answerChoicePos][1]
        return answer
    }
    
    //returns the third answer choice from a 2D array by its position
    func getAnswerChoice3(answerChoicePos: Int) -> String {
        let answer = answerChoices[answerChoicePos][2]
        return answer
    }
    
    //returns the correct answer for the question by their positions in an array
    func getCorrectAnswer(correctAnswerPos: Int) -> String {
        let answer = correctAnswers[correctAnswerPos]
        return answer
    }
    
    //returns the number of question in an array
    func getNoOfQuestions() -> Int {
        return questions.count
    }
}
