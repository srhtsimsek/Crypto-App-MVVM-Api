//
//  CrpyoTableViewCell.swift
//  Crypto App | MVVM & Api
//
//  Created by Serhat  Şimşek  on 11.06.2023.
//

import UIKit

class CrpyoTableViewCell: UITableViewCell {

    @IBOutlet weak var coinName: UILabel!
    @IBOutlet weak var coinPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
