//
//  MyFirstAppTableViewCell.swift
//  MyFirstApplication
//
//  Created by Mahmut Gazi Doğan on 25.11.2022.
//

import UIKit

class MyFirstAppTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var labelOnCell: UILabel!
    @IBOutlet weak var imageOnCell: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    

}


