//
//  WebService.swift
//  Crypto App | MVVM & Api
//
//  Created by Serhat  Şimşek  on 11.06.2023.
//

import Foundation

class WebService{
    
    
    func DownloadCurrency(url: URL, completion: @escaping([CryptoApp]?) -> ()){
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                let cryptoList = try? JSONDecoder().decode([CryptoApp].self, from: data)
                
                print(cryptoList)
                
                completion(cryptoList)
                
            }
        }.resume()
        
    }
    
    
    
}
