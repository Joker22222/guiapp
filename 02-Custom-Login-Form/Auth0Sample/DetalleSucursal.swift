//
//  DetalleSucursal.swift
//  GuiApp
//
//  Created by Fernando Garay on 5/2/18.
//  Copyright © 2018 Auth0. All rights reserved.
//

import UIKit

class DetalleSucursal: UIViewController {
    
    let vcDetalle = EditarSucursalViewController(nibName: "EditarSucursalViewController", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapEditar(_ sender: Any) {
        self.present(self.vcDetalle, animated: true, completion: nil)
    }
    
    @IBAction func tapBack(_ sender: Any) {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
