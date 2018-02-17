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
       
        
    }
    
    // MARK: - Private
    
    fileprivate func retrieveProfile() {
        guard let accessToken = loginCredentials.accessToken else {
            print("Error retrieving profile")
            let _ = self.navigationController?.popViewController(animated: true)
            return
        }
        Auth0
            .authentication()
            .userInfo(withAccessToken: accessToken)
            .start { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let profile):
                        guard let pictureURL = profile.picture else { return }
                        let task = URLSession.shared.dataTask(with: pictureURL) { (data, response, error) in
                            guard let _ = data , error == nil else { return }
                            DispatchQueue.main.async {
                            }
                        }
                        task.resume()
                    case .failure(let error):
                        self.showAlertForError(error)
                    }
                }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         if collectionView == destacados{
            return imagenesDestacados.count
         }else if collectionView == recientes{
            return imagenesRecientes.count
         }else {
            return imagenesCalendario.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == destacados{
            let cellDestacados = collectionView.dequeueReusableCell(withReuseIdentifier: "destacados", for: indexPath) as UICollectionViewCell
            let destacadosImage = cellDestacados.viewWithTag(1) as! UIImageView
            destacadosImage.image = imagenesDestacados[indexPath.row]
            return cellDestacados
        }else if collectionView == recientes{
            let cellRecientes = collectionView.dequeueReusableCell(withReuseIdentifier: "recientes", for: indexPath) as UICollectionViewCell
            let recientesImage = cellRecientes.viewWithTag(2) as! UIImageView
            recientesImage.image = imagenesRecientes[indexPath.row]
            return cellRecientes
        }else{
            let cellCalendario = collectionView.dequeueReusableCell(withReuseIdentifier: "calendario", for: indexPath) as UICollectionViewCell
            let calendarioImage = cellCalendario.viewWithTag(3) as! UIImageView
            calendarioImage.image = imagenesCalendario[indexPath.row]
            return cellCalendario
        }
    }




}
