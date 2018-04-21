//
//  EmpresasViewController.swift
//  GuiApp
//
//  Created by Fernando Garay on 19/04/2018.
//  Copyright © 2018 Auth0. All rights reserved.
//

import UIKit

class EmpresasViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, EmpresaViewModelDelegate, UIScrollViewDelegate {
    
    var viewModel : EmpresaViewModel?
    var empresas : Empresas?
    var empresaSelectedID: String?
    
    @IBOutlet weak var btnGuardar: UIButton!
    @IBOutlet weak var tfEmpresa: UITextField!
    @IBOutlet weak var tfCategoria: UITextField!
    @IBOutlet weak var tfPalabrasClaves: UITextField!
    @IBOutlet weak var tfTwitter: UITextField!
    @IBOutlet weak var tfInstagram: UITextField!
    @IBOutlet weak var tfFacebook: UITextField!
    @IBOutlet weak var tfEstado: UITextField!
    @IBOutlet weak var tfMetodoDePago: UITextField!
    @IBOutlet weak var tfCUIT: UITextField!
    @IBOutlet weak var tfRazonSocial: UITextField!
    @IBOutlet weak var contentViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var myScrollView: UIScrollView!
    @IBOutlet weak var tableViewHConstraint: NSLayoutConstraint!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        myScrollView.delegate = self
        viewModel = EmpresaViewModel()
        viewModel?.delegate = self
        viewModel?.recibir()
        createEmpresaPicker()
        //tableViewHConstraint.constant = 43*2
        //contentViewConstraint.constant = contentViewConstraint.constant - 43*3
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
       view.endEditing(true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "empresasCell", for: indexPath) as! EmpresasTableViewCell
        return cell
    }
    @IBAction func tapGuardar(_ sender: Any) {
        
        if (tfRazonSocial.text == "" || tfCUIT.text == "" || tfEstado.text == "" || tfPalabrasClaves.text == ""){
            let alert = UIAlertController(title: "Error", message: "Datos obligatorios faltantes.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        if( tfEmpresa.text == "Nueva Empresa" ){
            viewModel?.guardar(razonSocial: tfRazonSocial.text!,
                               cuit: tfCUIT.text!,
                               metodoPago: tfMetodoDePago.text!,
                               estado: tfEstado.text!,
                               facebook: tfFacebook.text!,
                               instagram: tfInstagram.text!,
                               twitter: tfTwitter.text!,
                               palabrasClaves: tfPalabrasClaves.text!,
                               categoria: tfCategoria.text!)
        }else{
            viewModel?.Actualizar(id: empresaSelectedID!,
                               razonSocial: tfRazonSocial.text!,
                               cuit: tfCUIT.text!,
                               metodoPago: tfMetodoDePago.text!,
                               estado: tfEstado.text!,
                               facebook: tfFacebook.text!,
                               instagram: tfInstagram.text!,
                               twitter: tfTwitter.text!,
                               palabrasClaves: tfPalabrasClaves.text!,
                               categoria: tfCategoria.text!)
        }
        
    }
    
    func createEmpresaPicker(){
        let empresaPicker = UIPickerView()
        empresaPicker.delegate = self
        tfEmpresa.inputView = empresaPicker
    }
    
    func setViews (row: Int){
        
        if(row == 0){
            tfEmpresa.text = "Nueva Empresa"
            tfRazonSocial.text = ""
            tfCUIT.text = ""
            tfMetodoDePago.text = ""
            tfEstado.text = ""
            tfFacebook.text = ""
            tfInstagram.text = ""
            tfTwitter.text = ""
            tfPalabrasClaves.text = ""
            tfCategoria.text = ""
        } else {
            tfEmpresa.text = empresas?.empresas[row-1].razonSocial
            tfRazonSocial.text = empresas?.empresas[row-1].razonSocial
            tfCUIT.text = empresas?.empresas[row-1].cuit
            tfMetodoDePago.text = empresas?.empresas[row-1].medioPago
            tfEstado.text = empresas?.empresas[row-1].estado
            tfFacebook.text = empresas?.empresas[row-1].facebook
            tfInstagram.text = empresas?.empresas[row-1].instagram
            tfTwitter.text = empresas?.empresas[row-1].twitter
            tfPalabrasClaves.text = empresas?.empresas[row-1].palabrasClave
            tfCategoria.text = ""
            empresaSelectedID = empresas?.empresas[row-1].id
        }
    }
    
    func finishSendingEmpresa() {
        viewModel?.recibir()
        let alert = UIAlertController(title: "Alerta", message: "Empresa guardada correctamente.", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    func finishGettingEmpresas(empresas: Empresas) {
        self.empresas = empresas
    }
}

extension EmpresasViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return (self.empresas?.empresas.count)! + 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (row == 0){
            return "Nueva Empresa"
        }else{
        return self.empresas?.empresas[row - 1].razonSocial
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.view.endEditing(true)
        self.setViews(row: row)
    }
}






