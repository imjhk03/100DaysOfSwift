//
//  ViewController.swift
//  Project2
//
//  Created by Joohee Kim on 5/9/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionsAsked = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Score", style: .plain, target: self, action: #selector(showScoreTapped))
    }

    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = "\(countries[correctAnswer].uppercased()) / \(score)"
        questionsAsked += 1
    }
    
    @objc func showScoreTapped() {
        let ac = UIAlertController(title: "Score", message: "Your score is \(score)", preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        present(ac, animated: true)
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        var message: String
        let isFinalQuestion = questionsAsked >= 10
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5) {
            sender.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        } completion: { _ in
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5) {
                sender.transform = .identity
            }
        }
        
        if sender.tag == correctAnswer {
            title = isFinalQuestion ? "Final" : "Correct"
            score += 1
            message = isFinalQuestion ? "Your final score is \(score)." : "Your score is \(score)"
            
            if isFinalQuestion {
                let defaults = UserDefaults.standard
                let savedScore = defaults.integer(forKey: "SavedScore")
                if score > savedScore {
                    message += "\n You beat your previous high score!"
                    defaults.set(score, forKey: "SavedScore")
                }
            }
        } else {
            title = isFinalQuestion ? "Final" : "Wrong"
            score -= 1
            message = isFinalQuestion ? "Your final score is \(score)." : "Wrong! That’s the flag of \(countries[sender.tag].uppercased())"
            
            if isFinalQuestion {
                let defaults = UserDefaults.standard
                let savedScore = defaults.integer(forKey: "SavedScore")
                if score > savedScore {
                    message += "\n You beat your previous high score!"
                    defaults.set(score, forKey: "Score")
                }
            }
        }
        
        let ac = UIAlertController(title: isFinalQuestion ? "End" : title, message: message, preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: isFinalQuestion ? "Done" : "Continue", style: .default, handler: isFinalQuestion ? nil : askQuestion))
        
        present(ac, animated: true)
    }
    
}

