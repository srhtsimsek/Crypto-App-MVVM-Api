//
//  CryptoViewModel.swift
//  Crypto App | MVVM & Api
//
//  Created by Serhat  Şimşek  on 11.06.2023.
//

import Foundation

struct CryptoListViewModel{
    
    let cryptoCurrencyList: [CryptoApp]
    
    func numberOfRowsInSection() -> Int{
        return self.cryptoCurrencyList.count
    }
    
    func cryptoAtIndex(_ index : Int) -> CryptoViewModel {
        let crypto = self.cryptoCurrencyList[index]
        return CryptoViewModel(cryptoCurrency: crypto)
    }
}

struct CryptoViewModel{
    
    let cryptoCurrency: CryptoApp
    
    var name : String {
        return self.cryptoCurrency.currency
    }
    
    var price : String {
        return self.cryptoCurrency.price
    }
    
}
