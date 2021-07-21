//
//  DatePickController.swift
//  CuntDownApp
//
//  Created by 이성호 on 2021/07/20.
//

import UIKit

protocol DatePickControllerProtocol {
    func dataSave(text : String, date: Date)
}

class DatePickController : UIViewController {
    
    var delegate: DatePickControllerProtocol?
    
    //MARK: Property

    
    lazy var saveBtn : UIButton = {
        let bt = UIButton(type: .system)
        bt.setTitle("Save", for: .normal)
        bt.backgroundColor = .white
        bt.tintColor = .black
        bt.addTarget(self, action: #selector(saveBtnTapped), for: .touchUpInside)
        return bt
    }()
    
    lazy var textField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Event Name..."
        tf.backgroundColor = .white
        tf.becomeFirstResponder()
        return tf
    }()
    
    lazy var datePicker : UIDatePicker = {
        let dp = UIDatePicker(frame: CGRect(x: 0, y: 0, width: view.frame.width - 20, height: 200))
        dp.preferredDatePickerStyle = .wheels
        dp.locale = Locale(identifier: "ko-KR")
        dp.timeZone = NSTimeZone.local
        dp.backgroundColor = .white
        dp.layer.cornerRadius = 5
        return dp
    }()
    //MARK: Selectors
    @objc func saveBtnTapped(){
        print(datePicker.date)
        if let text = textField.text, !text.isEmpty {
            let pickedDatetime = datePicker.date
            delegate?.dataSave(text: text, date: pickedDatetime)
        }
        self.navigationController?.popViewController(animated: true)
    }
    //MARK: Functions
    //MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureComponent()
    }
    //MARK: Configure
        func configure(){
            view.backgroundColor = .systemGray
            navigationItem.title = "New Event"
        }
        
        func configureComponent(){
            
            view.addSubview(textField)
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            textField.widthAnchor.constraint(equalToConstant: view.frame.width - 20).isActive = true
            textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
            
            view.addSubview(datePicker)
            datePicker.translatesAutoresizingMaskIntoConstraints = false
            datePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            datePicker.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            
            view.addSubview(saveBtn)
            saveBtn.translatesAutoresizingMaskIntoConstraints = false
            saveBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            saveBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
            saveBtn.widthAnchor.constraint(equalToConstant: view.frame.width - 20).isActive = true
            saveBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }

}
//MARK: Extensions

