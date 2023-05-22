//
//  List.swift
//  Project(Yug)
//
//  Created by R89 on 29/09/22.
//

import UIKit

class List: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var name = ["Brijesh", "Ujesh", "Roshan", "Manav", "Kishan", "Yash", "Himanshu"]
    
    var layout = ["typing", "I am using Whatsapp", "online"]
    
    
    @IBOutlet weak var Myimg: UIImageView!
    
    @IBOutlet weak var MyLayout: UILabel!
    @IBOutlet weak var MyTblVew: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        MyTblVew.delegate = self
        MyTblVew.dataSource = self
        //Myimg.layer.cornerRadius = 20
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as! ListCell
        cell.MyLbllistCell.text = name[indexPath.row].description
        //cell.MyLayout.text = layout[indexPath.row].description
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let navi = storyboard!.instantiateViewController(withIdentifier: "Chats") as! Chats
        navi.str = name[indexPath.row]
        self.tabBarController?.navigationController?.pushViewController(navi, animated: true)
        
    }
}
