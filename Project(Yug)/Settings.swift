//
//  Settings.swift
//  Project(Yug)
//
//  Created by R89 on 06/10/22.
//

import UIKit
import CoreData

class Settings: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func OnClickDeleteBtn(_ sender: UIButton) {
        deleteitem()
    }
    
    func deleteitem() {
        let appdele = (UIApplication.shared.delegate as! AppDelegate)
        let Vcon = appdele.persistentContainer.viewContext
        let req = NSFetchRequest<NSFetchRequestResult>(entityName: "Student")
        let obj2 = try? Vcon.fetch(req) as? [Student]
        for i in obj2 ?? [] {
            Vcon.delete(i)
        }
        appdele.saveContext()
    }


}
