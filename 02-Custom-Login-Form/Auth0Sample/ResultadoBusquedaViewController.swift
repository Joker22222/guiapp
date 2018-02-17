//
//  ResultadoBusquedaViewController.swift
//  GuiApp
//
//  Created by Fernando Garay on 12/1/18.
//  Copyright © 2018 Auth0. All rights reserved.
//

import UIKit

class ResultadoBusquedaViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    


    @IBOutlet weak var btnFlecha: NSLayoutConstraint!
    @IBOutlet weak var table: UITableView!
    let supermercados = ["Supermercado Impulso", "Supermercado Supermax", "Parada Canga", "Carrefour", "Mayorista El Nuevo Mayorista", "Supermercados Walmart", "Supermercado Impulso", "Supermercado Supermax", "Parada Canga", "Carrefour","Mayorista El Nuevo Mayorista", "Supermercados Walmart", "Supermercado Impulso"]
    let vcDetalle = DetalleBusquedaViewController(nibName: "DetalleBusquedaViewController", bundle: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapBack(_ sender: Any) {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
        dismiss(animated: true, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return supermercados.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultadoCell", for: indexPath) as! ResultadoBusquedaTableViewCell
        cell.selectionStyle = .none
        cell.lblnombre.text = supermercados[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.present(self.vcDetalle, animated: true, completion: nil)
    }

}
