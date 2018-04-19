//
//  ResultadoBusquedaTableViewCell.swift
//  GuiApp
//
//  Created by Fernando Garay on 12/1/18.
//  Copyright © 2018 Auth0. All rights reserved.
//

import UIKit

class ResultadoBusquedaTableViewCell: UITableViewCell {
    @IBOutlet weak var lblnombre: UILabel!
   
    @IBOutlet weak var lblComentario: UILabel!
    
    @IBOutlet weak var img24hs: UIImageView!
    @IBOutlet weak var lblDireccion: UILabel!
    @IBOutlet weak var imgEnvios: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
