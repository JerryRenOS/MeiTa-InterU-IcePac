//
//  ViewController.swift
//  MeiTa InterU IcePac
//
//  Created by Jerry Ren on 4/27/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit
class ViewController:UIViewController{override func viewDidLoad(){super.viewDidLoad()}}

class VoyagerViewController:  UIViewController {
    @IBOutlet weak var voyagerTableV: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        voyagerTableV.dataSource = self
        voyagerTableV.delegate = self
    }
}
extension VoyagerViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = voyagerTableV.dequeueReusableCell(withIdentifier: "ollec", for: indexPath) as! VoyagerCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 156  // maybe use cell.rowheight ?
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
}










