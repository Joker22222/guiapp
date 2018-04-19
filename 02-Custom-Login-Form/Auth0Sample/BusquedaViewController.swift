//
//  BusquedaViewController.swift
//  GuiApp
//
//  Created by Fernando Garay on 12/1/18.
//  Copyright © 2018 Auth0. All rights reserved.
//

import UIKit

class BusquedaViewController: UIViewController, BusquedaViewModelDelegate {

    @IBOutlet weak var busquedaTextField: UITextField!
    @IBOutlet weak var tFieldBuscar: UITextField!
    @IBOutlet weak var btnBuscar: UIButton!
    @IBOutlet weak var imgPublicidad: UIImageView!
    
    var latitud: String?
    var longitud: String?
    var param: String?
    var cat: String?
    var viewModel:BusquedaViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = BusquedaViewModel()
        viewModel?.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "perform search" {
            let nextScene =  segue.destination as! ResultadoBusquedaViewController
            if let lat = latitud {
                nextScene.latitud = lat
            }else{
                nextScene.latitud = "0"
            }
            
            if let long = longitud {
                nextScene.longitud = long
            }else{
                nextScene.longitud = "0"
            }
            
            if let category = cat {
                nextScene.cat = category
            }else{
                nextScene.cat = ""
            }
            
            if let parameter = param {
                nextScene.param = parameter
            }else{
                nextScene.param = ""
            }
        }
    }
    
    @IBAction func tapBtnBuscar(_ sender: Any) {
        if (tFieldBuscar.text != ""){
            param = tFieldBuscar.text
            buscar()
        }
    }
    @IBAction func tapModa(_ sender: Any) {
        cat = "0"
        buscar()
    }
    @IBAction func tapGastronomia(_ sender: Any) {
        cat = "1"
        buscar()
    }
    @IBAction func tapSalud(_ sender: Any) {
        cat = "2"
        buscar()
    }
    @IBAction func tapEntretenimiento(_ sender: Any) {
        cat = "3"
        buscar()
    }
    @IBAction func tapTransportes(_ sender: Any) {
        cat = "4"
        buscar()
    }
    @IBAction func tapServicios(_ sender: Any) {
        cat = "5"
        buscar()
    }
    @IBAction func tapTurismo(_ sender: Any) {
        cat = "6"
        buscar()
    }
    @IBAction func tapCalendario(_ sender: Any) {
        cat = "7"
        buscar()
    }
    @IBAction func tapMas(_ sender: Any) {
        cat = "8"
        buscar()
    }
    
    func buscar(){
        performSegue(withIdentifier: "perform search", sender: nil)
    }
    func finishGettingPublicidad() {
        imgPublicidad.downloadedFrom(link: (viewModel?.publicidades?.publicidades[0].imagen)!)
    }
}

