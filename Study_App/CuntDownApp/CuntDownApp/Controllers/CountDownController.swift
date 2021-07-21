//
//  CountDownController.swift
//  CuntDownApp
//
//  Created by 이성호 on 2021/07/20.
//

import UIKit


class CountDownController : UIViewController {

    //MARK: Property
    let nextVC = DatePickController()
    
    var hours = 0
    var mins = 0
    var secs = 0
    
    lazy var nameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.numberOfLines = 0
        label.text = "해야 할 일"
        label.textAlignment = .center
        return label
    }()
    
    lazy var dateLabel : UILabel = {
        let label = UILabel()
        label.text = "약속 날짜,시간 : "
        label.numberOfLines = 0
        return label
    }()
    
    lazy var dateValueLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    lazy var countDownTimeLabel : UILabel = {
        let label = UILabel()
        label.text = "남은 시간 : "
        label.numberOfLines = 0
        return label
    }()
    
    lazy var countDownValueTimeLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()

    
    let fommater: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .short
        f.locale = Locale(identifier: "Ko_kr")
        return f
    }()
    
    //MARK: Selectors
    @objc func addTapped(){
        navigationController?.pushViewController(nextVC, animated: true)
    }
    //MARK: Functions
    func updateLabel(){
        countDownValueTimeLabel.text = "\(hours)시 \(mins)분 \(secs)초"
    }
    
    func startTimer(){
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
            if self.secs > 0 {
                self.secs = self.secs - 1
            } else if self.mins > 0 && self.secs == 0 {
                self.mins = self.mins - 1
                self.secs = 59
            } else if self.hours > 0 && self.mins == 0 && self.secs == 0{
                self.hours = self.hours - 1
                self.mins = 59
                self.secs = 59
            }
            self.updateLabel()
        })
    }
    
    func countDown(targetDate: Date){
        let difference = floor(targetDate.timeIntervalSince(Date()))
        if difference > 0.0 {
            let Computedhours: Int = Int(difference) / 3600
            let remainder: Int = Int(difference) - (hours * 3600)
            let minutes: Int = remainder / 60
            let seconds: Int = Int(difference) - (hours * 3600) - (minutes * 60)
            hours = Computedhours
            mins = minutes
            secs = seconds
            countDownValueTimeLabel.text = "\(hours)시 \(minutes)분 \(seconds)초"
            
            startTimer()
            
        }
    }

    //MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureComponent()
    }
    //MARK: Configure
        func configure(){
            view.backgroundColor = .systemGray

            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
            
            nextVC.delegate = self
        }
        
        func configureComponent(){
            
            view.addSubview(nameLabel)
            nameLabel.translatesAutoresizingMaskIntoConstraints = false
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
            nameLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
            
            view.addSubview(dateLabel)
            dateLabel.translatesAutoresizingMaskIntoConstraints = false
            dateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 100).isActive = true
            dateLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 30).isActive = true
            dateLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true

            view.addSubview(dateValueLabel)
            dateValueLabel.translatesAutoresizingMaskIntoConstraints = false
            dateValueLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 100).isActive = true
            dateValueLabel.leftAnchor.constraint(equalTo: dateLabel.rightAnchor).isActive = true
            dateValueLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
            dateValueLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
            
            view.addSubview(countDownTimeLabel)
            countDownTimeLabel.translatesAutoresizingMaskIntoConstraints = false
            countDownTimeLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 50).isActive = true
            countDownTimeLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 30).isActive = true
            countDownTimeLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
            countDownTimeLabel.widthAnchor.constraint(equalTo: dateLabel.widthAnchor).isActive = true
            
            view.addSubview(countDownValueTimeLabel)
            countDownValueTimeLabel.translatesAutoresizingMaskIntoConstraints = false
            countDownValueTimeLabel.topAnchor.constraint(equalTo: dateValueLabel.bottomAnchor, constant: 50).isActive = true
            countDownValueTimeLabel.leftAnchor.constraint(equalTo: countDownTimeLabel.rightAnchor).isActive = true
            countDownValueTimeLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
            countDownValueTimeLabel.widthAnchor.constraint(equalTo: dateValueLabel.widthAnchor).isActive = true
        }

}
//MARK: Extensions
extension CountDownController: DatePickControllerProtocol {
    func dataSave(text: String, date: Date) {
        self.countDown(targetDate: date)
        nameLabel.text = text
        dateValueLabel.text = fommater.string(from: date)
    }
}
