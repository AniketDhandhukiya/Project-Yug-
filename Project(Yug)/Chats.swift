//
//  Chats.swift
//  Project(Yug)
//
//  Created by R89 on 03/10/22.
//

import UIKit
import CoreData

class Chats: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITableViewDelegate, UITableViewDataSource{
 
    
    @IBOutlet weak var myChatsTextField: UITextField!
    
    @IBOutlet weak var Img: UIImageView!
    
    @IBOutlet weak var SendBtn: UIButton!
    
    @IBOutlet weak var MyVwv: UIView!
    
    @IBOutlet weak var MyTblVw: UITableView!
    
    @IBOutlet weak var MyLbl: UILabel!
    
    let x = UIImagePickerController()
    
    var str = ""
    
    var chat = [String]()
    
    var timestore = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MyLbl.text = str
        // Do any additional setup after loading the view.
        MyTblVw.delegate = self
        MyTblVw.backgroundColor = .clear
        MyTblVw.dataSource = self
        MyTblVw.layer.borderColor = UIColor.black.cgColor
        MyTblVw.layer.cornerRadius = 20
        myChatsTextField.layer.cornerRadius = 40
        MyVwv.layer.cornerRadius = 20
        if chat.isEmpty != true {
            MyTblVw.scrollToRow(at: IndexPath(row: chat.count-1, section: 0), at: .bottom, animated: true)
        }
        SendBtn.layer.borderColor = UIColor.white.cgColor
        myChatsTextField.addTarget(self, action: #selector(OnChangeBtn), for: .editingChanged)
        getData()
        MyTblVw.reloadData()
    }
    
    @IBAction func onClickbackbtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func insertData(datatext: String,datetext: String) {
        let appdele = (UIApplication.shared.delegate as! AppDelegate)
        let Vcon = appdele.persistentContainer.viewContext
        let tbl = NSEntityDescription.entity(forEntityName: "Student", in: Vcon)!
        let obj = NSManagedObject(entity: tbl, insertInto: Vcon)
        obj.setValue(datatext, forKey: "data")
        obj.setValue(datatext, forKey: "bool")
        appdele.saveContext()
    }
    
    func getData() {
        let appdele = (UIApplication.shared.delegate as! AppDelegate)
        let Vcon = appdele.persistentContainer.viewContext
        let req = NSFetchRequest<NSFetchRequestResult>(entityName: "Student")
        let obj1 = try? Vcon.fetch(req) as? [Student]
        for i in obj1 ?? [] {
//            chat.append(i.value(forKey: "data") as! String)
            chat.append(i.data!)
            timestore.append(i.bool!)
        }
        MyTblVw.reloadData()
    }
    
    
    @objc func OnChangeBtn() {
        if myChatsTextField.text != "" {
            SendBtn.isSelected = true
        } else {
            SendBtn.isSelected = false
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        chat.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % 2 == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ChatCell1", for: indexPath) as! ChatCell1
            cell.MylblChatCell1.text = chat[indexPath.row]
            cell.MyLbl2.text = timestore[indexPath.row]
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatsCell", for: indexPath) as! ChatsCell
        cell.MyLblchatCell.text = chat[indexPath.row]
        cell.MyLbl1.text = timestore[indexPath.row]
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) -> <#Return Type#> {
//        var alt = UIAlertController(nibName: "bnfgc", bundle: nil)
//        return alt
//    }

    
    
    @IBAction func onClickSendBtn(_ sender: UIButton) {
        if myChatsTextField.text != "" {
            chat.append(myChatsTextField.text!)
            //insertData(datatext: myChatsTextField.text!)
            myChatsTextField.text = ""
            OnChangeBtn()
            var setDate = DateFormatter()
            setDate.dateFormat = "hh:mm:ss"
            let x = setDate.string(from: Date())
            timestore.append(x)
            insertData(datatext: myChatsTextField.text!, datetext: x)
            MyTblVw.reloadData()
            MyTblVw.scrollToRow(at: IndexPath(row: chat.count-1, section: 0), at: .bottom, animated: true)
        }
            
    }
    
    @IBAction func OnClickimgbtn(_ sender: Any) {
        x.delegate = self
        x.sourceType = .photoLibrary
        self.present(x, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let y = info[.originalImage]
        Img.image = y as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
}
