//
//  DetailViewController.swift
//  MyFirstApplication
//
//  Created by Mahmut Gazi Doğan on 28.11.2022.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    
    var characterDetail: ResultsModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let char = characterDetail {
            
            if let url = URL(string: char.image ?? ""){
                DispatchQueue.global().async { [weak self] in
                    if let data = try? Data(contentsOf: url) {
                        if let image = UIImage(data: data) {
                            DispatchQueue.main.async {
                                self?.detailImageView.image = image
                                self?.detailImageView.reloadInputViews()
                            }
                        }
                    }
                }
            }
            nameLabel.text = char.name
            statusLabel.text = char.status
            speciesLabel.text = char.species
            genderLabel.text = char.gender
        }
    }
    
}
