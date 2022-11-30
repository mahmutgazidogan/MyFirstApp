//
//  ViewController.swift
//  MyFirstApplication
//
//  Created by Mahmut Gazi Doğan on 24.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var dataList = [ResultsModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        getAllNames()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let index = sender as? Int {
            let gotoDetailVC = segue.destination as? DetailViewController
            let dt = dataList[index]
            gotoDetailVC?.characterDetail = dt
        }
    }
    
    func getAllNames(){
        
        let url = URL(string: "https://rickandmortyapi.com/api/character")!
        URLSession.shared.dataTask(with: url){ data,response,error in
            
            if error != nil || data == nil {
                print("Error")
                return
            }
            
            do{
                let answer = try JSONDecoder().decode(ResponseModel.self, from: data!)
                if let comingNameList = answer.results {
                    self.dataList = comingNameList
                } else{
                    self.dataList = [ResultsModel]()
                }
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            } catch{
                print(error.localizedDescription)
            }
            
        }.resume()
        
    }
    
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            } else{
                UITableViewCell().reloadInputViews()
                return
            }
        }
    }
}

extension ViewController:UITableViewDataSource,UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO: - Yeni erkan gecisi burada yapilacak her celle tiklandiginda o celldeki veriler diger viewControllerda gosterilecek bunuda modeli gecirerek yapabilirsin veya tek tek degiskenleri
        //var characterDetail: ResultsModel? gidilecek vc
        // let dt = dataList[indexPath.row]
        // vc.characterDetail = dt
        
        self.performSegue(withIdentifier: "toDetailVC", sender: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let dt = dataList[indexPath.row]
        guard let name = dt.name else { return UITableViewCell()}
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellName", for: indexPath) as? MyFirstAppTableViewCell else { return UITableViewCell()}
        cell.labelOnCell.text =  "\(name)"
        
        guard let url = URL(string: dt.image ?? "") else { return UITableViewCell()}
        cell.imageOnCell.load(url: url)
        
        return cell
    }
}

