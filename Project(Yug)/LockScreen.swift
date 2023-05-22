//
//  LockScreen.swift
//  Project(Yug)
//
//  Created by R89 on 13/10/22.
//

import UIKit

class LockScreen: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var myLockBtn: UIButton!
    
    @IBOutlet weak var myLockCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        myLockCollection.delegate = self
        myLockCollection.dataSource = self
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = UICollectionViewCell()
        
    }
}
