//
//  GameController.swift
//  QuizApp
//
//  Created by 이성호 on 2021/07/19.
//

import UIKit

private let reusealbeIdentifier = "cell"

class GameViewController : UIViewController {
    //MARK: Property
    lazy var tableView: UITableView = {
        let tv = UITableView()
        return tv
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        return label
    }()
    
    var gameModels = [Question]()
    
    var currentQuestion : Question?
    
    //MARK: Selectors
    
    //MARK: Functions
    func checkAnswer(answer: Answer , question: Question) -> Bool {
        if question.answers.contains(where: {$0.text == answer.text }){
            return answer.correct
        }
        return false
    }
    
    func setupQuestions(){
        gameModels.append(Question(text: "What is 2 + 2 ", answers: [
                                    Answer(text: "1", correct: false),
                                    Answer(text: "4", correct: true),
            						Answer(text: "2", correct: false),
                                    Answer(text: "3", correct: false)
        ]
        ))
        gameModels.append(Question(text: "What is 2 + 12 ", answers: [
                                    Answer(text: "10", correct: false),
                                    Answer(text: "11", correct: false),
                                    Answer(text: "12", correct: false),
                                    Answer(text: "14", correct: true)
        ]
        ))
        gameModels.append(Question(text: "What is 5 + 4 ", answers: [
                                    Answer(text: "1", correct: false),
                                    Answer(text: "9", correct: true),
                                    Answer(text: "2", correct: false),
                                    Answer(text: "3", correct: false)
        ]
        ))
    }
    
    //MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        setupQuestions()
        configureComponent(question: gameModels.first!) // 순서 바꿔볼것
    }
    
    //MARK: Configure
        func configure(){
            view.backgroundColor = .systemPurple
            navigationController?.navigationBar.tintColor = .white
        }
        
    func configureComponent(question: Question){
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.text = question.text
        
        currentQuestion = question
        
        tableView.register(TableCell.self, forCellReuseIdentifier: reusealbeIdentifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 150).isActive = true
        tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tableView.widthAnchor.constraint(equalToConstant: 280).isActive = true
        tableView.heightAnchor.constraint(equalToConstant: 280).isActive = true
        
        
    }
}
//MARK: Extensions
extension GameViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentQuestion?.answers.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reusealbeIdentifier, for: indexPath) as! TableCell
        
        cell.label.text = currentQuestion?.answers[indexPath.row].text
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let question = currentQuestion else { return }
        let answer = question.answers[indexPath.row]
        if checkAnswer(answer: answer, question: question) {
            //correct
            if let index = gameModels.firstIndex(where: {$0.text == question.text}){
                if index < (gameModels.count - 1) {
                    //next question
                    let nextQuestion = gameModels[index + 1]
                    configureComponent(question: nextQuestion)
                    tableView.reloadData()
                }
                else {
                    // end of game
                    let alert = UIAlertController(title: "끝", message: "끝났어요.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
                    
                    present(alert, animated: true)
                }
            }
        } else {
            //wrong
            let alert = UIAlertController(title: "틀렸어요.", message: "다시 풀어보세요.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
            
            present(alert, animated: true)
        }
    }
    
}
