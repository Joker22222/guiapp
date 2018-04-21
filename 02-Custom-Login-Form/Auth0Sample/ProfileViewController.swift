// ProfileViewController.swift
// Auth0Sample
//
// Copyright (c) 2016 Auth0 (http://auth0.com)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit
import Auth0

class ProfileViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   
    
    @IBOutlet weak var scrollview: UIScrollView!
    
    @IBOutlet weak var destacados: UICollectionView!
    @IBOutlet weak var recientes: UICollectionView!
    @IBOutlet weak var calendario: UICollectionView!
    
    var homeVM:  HomeViewModel?
    let url = "https://artescritorio.com/wp-content/uploads/2015/11/monsterball-icon-pack.png"
    var imagenesDestacados: [UIImage] = [
        UIImage(named: "destacado1")!,
        UIImage(named: "destacado2")!,
        UIImage(named: "destacado3")!,
        UIImage(named: "destacado1")!,
        UIImage(named: "destacado2")!,
        UIImage(named: "destacado3")!,
        UIImage(named: "destacado1")!,
        UIImage(named: "destacado2")!
    ]
    
    var imagenesCalendario: [UIImage] = [
        UIImage(named: "calendariodash")!,
        UIImage(named: "calendariodash")!,
        UIImage(named: "calendariodash")!,
        UIImage(named: "calendariodash")!,
        UIImage(named: "calendariodash")!,
        UIImage(named: "calendariodash")!,
        UIImage(named: "calendariodash")!,
        UIImage(named: "calendariodash")!,
        UIImage(named: "calendariodash")!
    ]
    
    var imagenesRecientes: [UIImage] = [
        UIImage(named: "masRecientes1")!,
        UIImage(named: "masRecientes2")!,
        UIImage(named: "masRecientes3")!,
        UIImage(named: "masRecientes1")!,
        UIImage(named: "masRecientes2")!,
        UIImage(named: "masRecientes3")!,
        UIImage(named: "masRecientes1")!,
        UIImage(named: "masRecientes2")!,
        UIImage(named: "masRecientes3")!
    ]
    
    
    var loginCredentials: Credentials!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.retrieveProfile()
        destacados.delegate = self
        destacados.dataSource = self
        recientes.delegate = self
        recientes.dataSource = self
        calendario.delegate = self
        calendario.dataSource = self
        self.view.addSubview(destacados)
        self.view.addSubview(recientes)
        self.view.addSubview(calendario)
        homeVM = HomeViewModel()
        homeVM?.delegate = self
    }
    
    // MARK: - Private
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         if collectionView == destacados{
            if (homeVM?.listaPublicacionesDest != nil){
                return (homeVM?.listaPublicacionesDest?.count)!
            }else{
                return 0
            }
         }else if collectionView == recientes{
            if (homeVM?.listaPublicaciones != nil){
                return (homeVM?.listaPublicaciones?.count)!
            }else{
                return 0
            }
         }else {
            if (homeVM?.listaEventos != nil){
                return (homeVM?.listaEventos?.count)!
            }else{
                return 0
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == destacados{
            let cellDestacados = collectionView.dequeueReusableCell(withReuseIdentifier: "destacados", for: indexPath) as UICollectionViewCell
            let destacadosImage = cellDestacados.viewWithTag(1) as! UIImageView
            let destacadoTitulo = cellDestacados.viewWithTag(5) as! UILabel
            destacadosImage.image = nil
            destacadoTitulo.text = nil
            if (homeVM?.listaPublicacionesDest != nil){
                destacadosImage.downloadedFrom(link: (homeVM?.listaPublicacionesDest![indexPath.row].imagen)!)
                destacadoTitulo.text = homeVM?.listaPublicacionesDest![indexPath.row].titulo
            }
            destacadosImage.image = imagenesDestacados[indexPath.row]
            return cellDestacados
       
        
        }else if collectionView == recientes{
            let cellRecientes = collectionView.dequeueReusableCell(withReuseIdentifier: "recientes", for: indexPath) as UICollectionViewCell
            let recientesImage = cellRecientes.viewWithTag(2) as! UIImageView
            let recintesTitulo = cellRecientes.viewWithTag(4) as! UILabel
            recientesImage.image = nil
            recintesTitulo.text = nil
            if (homeVM?.listaPublicaciones != nil){
                recientesImage.downloadedFrom(link: (homeVM?.listaPublicaciones![indexPath.row].imagen)!)
                recintesTitulo.text = homeVM?.listaPublicaciones![indexPath.row].titulo
            }
            return cellRecientes
       
        
        }else{
            let cellCalendario = collectionView.dequeueReusableCell(withReuseIdentifier: "calendario", for: indexPath) as UICollectionViewCell
    
            let calendarioTipo = cellCalendario.viewWithTag(6) as! UILabel
            let calendarioTitulo = cellCalendario.viewWithTag(7) as! UILabel
            let calendarioDescripcion = cellCalendario.viewWithTag(8) as! UILabel
            let calendarioFecha = cellCalendario.viewWithTag(9) as! UILabel
            
            if (homeVM?.listaEventos != nil){
    
                calendarioTipo.text = homeVM?.listaEventos![indexPath.row].tipo
                calendarioTitulo.text = homeVM?.listaEventos![indexPath.row].nombre
                calendarioDescripcion.text = homeVM?.listaEventos![indexPath.row].descripcion
                calendarioFecha.text = formatDate(dateString: (homeVM?.listaEventos![indexPath.row].fechaInicio)!)
            }
            return cellCalendario
        }
    }

    func formatDate (dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.locale = Locale.init(identifier: "es_AR")
        
        let dateObj = dateFormatter.date(from: dateString)
        
        dateFormatter.dateFormat = "dd MMM"
        return dateFormatter.string(from: dateObj!).uppercased()
    }
}

extension ProfileViewController: HomeViewModelDelegate {
    func finishedGettingPublicacionesDest() {
        self.destacados.reloadData()
    }
    
    func finishedGettingPublicaciones() {
        self.recientes.reloadData()
    }
    
    func finishedGettingEventos() {
        self.calendario.reloadData()
    }
    
    func finishedGettingEventosWithError(_ error: NSError) {
        
    }
    
    
}

extension UIImageView {
    func downloadedFrom(url: URL) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url)
    }
}
