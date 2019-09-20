//
//  ViewController.swift
//  TestCoreData
//
//  Created by pachie on 18/09/2019.
//  Copyright © 2019 pachie. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var people = [NSManagedObject]()

    @IBOutlet weak var txtName: UITextField!
    
    @IBOutlet weak var txtLastName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func btnSaveClicked(_ sender: Any) {
    
//        guard let appDel = UIApplication.shared.delegate as? AppDelegate else {
//            return
//        }
//
//        let managedContext = appDel.persistentContainer.viewContext
//
//        let entity = NSEntityDescription.entity(forEntityName: "Person", in: managedContext)!
//
//        let person = NSManagedObject(entity: entity, insertInto: managedContext)
//
//        person.setValue(txtName.text, forKey: "name")
//        person.setValue(txtLastName.text, forKey: "lastname")
//
//        do {
//            try managedContext.save()
//            people.append(person)
//        } catch let error as NSError {
//            print("Could not saved \(error), \(error.userInfo)")
//        }
//
//
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
//
//        do
//        {
//            let result = try managedContext.fetch(fetchRequest)
//
//            for data in result as! [NSManagedObject] {
//                print(data.value(forKey: "name") as! String)
//            }
//        }
//        catch
//        {
//            print("failed \(error.localizedDescription)")
//        }
        
        

        guard let appDel = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let manObj = appDel.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Person", in: manObj)!
        
        let person = NSManagedObject(entity: entity, insertInto: manObj)
        
        person.setValue(txtName.text, forKey: "name")
        person.setValue(txtLastName.text, forKey: "lastname")
        
        
        do {
            try manObj.save()
            
            print("Record has been saved")
        } catch let error as NSError {
            print(error.userInfo)
        }
        
        
        
        //fetch
        
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
        
        
        do {
            let result = try manObj.fetch(fetch)
            
            for data in result as! [NSManagedObject] {
                
                print(data.value(forKey: "name") as! String)
            }
            
            
        } catch let error as NSError {
            print(error.userInfo)
        }
        
        
        
        
        
        
        
        
        
    }
}

