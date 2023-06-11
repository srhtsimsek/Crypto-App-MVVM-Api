//
//  ViewController.swift
//  Crypto App | MVVM & Api
//
//  Created by Serhat  Şimşek  on 11.06.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    private var cryptoListViewModel : CryptoListViewModel!
    
    var renkler = [UIColor]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        self.renkler.append(UIColor.red)
        self.renkler.append(UIColor.green)
        self.renkler.append(UIColor.purple)
        self.renkler.append(UIColor.yellow)
        self.renkler.append(UIColor.orange)
        self.renkler.append(UIColor.blue)
  
        getData()
        
    }

    func getData(){
        
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
        WebService().DownloadCurrency(url: url) { cryptos in
            if let cryptos = cryptos {
                self.cryptoListViewModel = CryptoListViewModel(cryptoCurrencyList: cryptos)
                DispatchQueue.main.async{
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  self.cryptoListViewModel == nil ? 0: self.cryptoListViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCell", for: indexPath) as! CrpyoTableViewCell
        let cryptoViewModel = self.cryptoListViewModel.cryptoAtIndex(indexPath.row)
        
        cell.coinName.text = cryptoViewModel.name
        cell.coinPrice.text = cryptoViewModel.price
        cell.backgroundColor = renkler[indexPath.row % 6].withAlphaComponent(0.15)
                return cell
    }
    
}

