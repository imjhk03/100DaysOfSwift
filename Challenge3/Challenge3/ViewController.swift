//
//  ViewController.swift
//  Challenge3
//
//  Created by Joohee Kim on 5/27/24.
//

import UIKit

class ViewController: UITableViewController {
    var allWords = [String]()
    var usedLetters = [String]()
    var promptWord = ""
    var word = ""
    var wrongAnswers: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promptForAnswer))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(startGame))
        
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
                if let startWords = try? String(contentsOf: startWordsURL) {
                    self?.allWords = startWords.components(separatedBy: "\n")
                }
            }
            
            if let allWords = self?.allWords, allWords.isEmpty {
                self?.allWords = ["RHYTHM"]
            }
        }
        
        DispatchQueue.main.async { [weak self] in
            self?.startGame()
        }
    }
    
    @objc func startGame() {
        word = allWords.randomElement()?.uppercased() ?? "RHYTHM"
        promptWord = ""
        let count = word.count
        for _ in 1...count {
            promptWord += "?"
        }
        title = promptWord
        usedLetters.removeAll()
        tableView.reloadData()
        print(word)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usedLetters.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Letter", for: indexPath)
        cell.textLabel?.text = usedLetters[indexPath.row]
        return cell
    }
    
    @objc func promptForAnswer() {
        let ac = UIAlertController(title: "Enter letter", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let submitAction = UIAlertAction(title: "Submit", style: .default) { [weak self, weak ac] action in
            guard let letter = ac?.textFields?[0].text?.first else { return }
            self?.submit(String(letter))
        }
        
        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
    func submit(_ letter: String) {
        usedLetters.insert(letter.uppercased(), at: 0)
        
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
        
        promptWord = ""
        
        for letter in word {
            let strLetter = String(letter)
            
            if usedLetters.contains(strLetter) {
                promptWord += strLetter.uppercased()
            } else {
                promptWord += "?"
            }
        }
        
        if !word.contains(letter.uppercased()) {
            wrongAnswers += 1
        }
        
        title = promptWord
        
        if wrongAnswers == 8 {
            let ac = UIAlertController(title: "Game End!", message: "You reached the letter count.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        } else {
            if promptWord == word {
                let ac = UIAlertController(title: "Win!", message: "You found the word!", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "OK", style: .default))
                present(ac, animated: true)
            }
        }
    }
}

