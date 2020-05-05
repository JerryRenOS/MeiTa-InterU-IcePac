//
//  VoyagerCell.swift
//  MeiTa InterU IcePac
//
//  Created by Jerry Ren on 5/5/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

class VoyagerCell: UITableViewCell {
    
    @IBOutlet weak var voyagerCollectionV: UICollectionView!
    @IBOutlet weak var voyagerCelloRabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        voyagerCollectionV.delegate = self
        voyagerCollectionV.dataSource = self
    }
}

extension VoyagerCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celloc = voyagerCollectionV.dequeueReusableCell(withReuseIdentifier: "onitcelloc", for: indexPath) as! VoyagerCollectionCell
        celloc.voyagerCollectionVcRabel.text = collectionCRabelArray[indexPath.row]
        celloc.voyagerCollectionVcImage.image = UIImage(named: collectionCImagesArray[indexPath.row])
        return celloc
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionCImagesArray.count
    }
}

extension VoyagerCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 105, height: 97)
    }
}

var collectionCImagesArray = ["Pic-Burma", "Pic-Phillipines", "Pic-Carribean_Dominica", "Pic-Osaka","Pic-Indonesia","Pic-Laos"]
var collectionCRabelArray = ["Burma", "Phillipines", "Dominica", "Japan", "Indonesia", "Laos"]
       
