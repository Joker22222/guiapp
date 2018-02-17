//
//  DetalleBusquedaViewController.swift
//  GuiApp
//
//  Created by Fernando Garay on 12/1/18.
//  Copyright © 2018 Auth0. All rights reserved.
//

import UIKit

class DetalleBusquedaViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var btnBack: UIButton!
    
    let sucursales = ["Sucursal Av. Maipú", "Sucursal Bolivar", "Sucursal Santa Ana", "Sucursal Av. Maipú", "Sucursal Bolivar", "Sucursal Santa Ana", "Sucursal Av. Maipú", "Sucursal Bolivar", "Sucursal Santa Ana", "Sucursal Av. Maipú", "Sucursal Bolivar", "Sucursal Santa Ana"]
    @IBOutlet weak var table: UITableView!
    let vcDetalle = DetalleSucursal(nibName: "DetalleSucursal", bundle: nil)
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backTap(_ sender: Any) {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
        dismiss(animated: true, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sucursales.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "detalleCell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "detalleCell", for: indexPath) as! TableViewCell
        cell.selectionStyle = .none
        cell.lblSucursal.text = sucursales[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.present(self.vcDetalle, animated: true, completion: nil)
    }

}
