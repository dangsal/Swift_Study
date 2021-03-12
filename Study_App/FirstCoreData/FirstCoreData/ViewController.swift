//
//  ViewController.swift
//  FirstCoreData
//
//  Created by 이성호 on 2021/03/12.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    var context: NSManagedObjectContext {
        guard let app = UIApplication.shared.delegate as? AppDelegate else {
            fatalError()
        }
        
        return app.persistentContainer.viewContext
    }
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var ageField: UITextField!
    
    
    
    @IBAction func createEntity(_ sender: Any) {
        guard let name = nameField.text else {return}
        guard let age = ageField.text else {return}
        
        let newEntity = NSEntityDescription.insertNewObject(forEntityName: "Person", into: context)
        
        newEntity.setValue(name, forKey: "name")
        newEntity.setValue(age, forKey: "age")
        
        if context.hasChanges {
            do {
                try context.save()
                print("Saved")
            } catch{
                print(error)
            }
        }
        nameField.text = nil
        ageField.text = nil
    }
    
    @IBAction func readEntity(_ sender: Any) {
    }
    
    @IBAction func updataEntity(_ sender: Any) {
    }
    
    @IBAction func deleteEntity(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

