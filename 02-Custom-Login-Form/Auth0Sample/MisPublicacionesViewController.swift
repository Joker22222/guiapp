//
//  MisPublicacionesViewController.swift
//  GuiApp
//
//  Created by Fernando Garay on 6/2/18.
//  Copyright © 2018 Auth0. All rights reserved.
//

import UIKit

class MisPublicacionesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var imagenes: [UIImage] = [
        UIImage(named: "editar_publi_imagen1")!,
        UIImage(named: "editar_publi_imagen2")!,
        UIImage(named: "editar_publi_imagen1")!,
        UIImage(named: "editar_publi_imagen2")!,
        UIImage(named: "editar_publi_imagen1")!,
        UIImage(named: "editar_publi_imagen2")!,
        UIImage(named: "editar_publi_imagen1")!,
        UIImage(named: "editar_publi_imagen2")!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imagenes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "publicacionesCell", for: indexPath) as!MisPublicacionesTableViewCell
        cell.selectionStyle = .none
        cell.imgPubli.image = imagenes[indexPath.row]
        return cell
    }
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 101
    }
    @IBAction func tapBack(_ sender: Any) {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
        dismiss(animated: true, completion: nil)    }
    
}
