//
//  ApiController.swift
//  kraken-portfolio
//
//  Created by Christian Larsen on 03/03/2018.
//  Copyright © 2018 Christian Larsen. All rights reserved.
//

import Foundation


struct cryptoCoin : Decodable{
    var acronym : String = ""
    var name : String = ""
    var USD : Decimal = 0
    var EUR : Decimal = 0
    var DKK : Decimal = 0
    var price1h : Decimal = 0
    var price24h : Decimal = 0
    
    //init(acronym: String, name: String, USD: Decimal, EUR: Decimal, DKK: Decimal, price1h: Decimal, price24h: Decimal) {
    //    self.acronym = acronym
    //    self.name = name
    //    self.USD = USD
    //    self.EUR = EUR
    //    self.DKK = DKK
    //    self.price1h = price1h
    //    self.price24h = price24h
    //}
}



class Api{
    
    //supported cryptocoins
    let cryptocurrencies = [("ETH", "Ethereum"), ("BCH","Bitcoin Cash"), ("BTC","Bitcoin"), ("XRP", "Ripple"), ("DASH","Dash"), ("LTC","Litecoin"), ("GNO","Gnosis"), ("XMR","Monero")]
    func fetch() -> Array<cryptoCoin> {
        //var pricedata = [cryptoCoin]()
        //cryptocurrencies[index].0 or 1
        for coin in cryptocurrencies{
            
            //var crypto = cryptoCoin()
            
            let urlToParse = URL(string: "https://min-api.cryptocompare.com/data/pricemulti?fsyms=" + coin.0 + "&tsyms=USD,EUR,DKK")
            let task = URLSession.shared.dataTask(with: urlToParse!) { (data, response, error) in
                if error != nil{
                    print("error")
                }
                else{
                    do{
                        if let content = data{
                            do{
                                let fetchedData = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                                if let prices = fetchedData[coin.0] as? NSDictionary{
                                    //if let p = prices["DKK"]{
                                        //crypto.USD = p
                                        
                                    }
                                    //let dkk = Decimal(string: prices["DKK"] as! String)
                                 
                                    //crypto.acronym = coin.0
                                    //crypto.name = coin.1
                                    //crypto.USD = usd!
                                    //crypto.EUR = eur!
                                    //crypto.DKK = dkk!
                                    //pricedata.append(crypto)
                                    //print(crypto)
                                }
                            }
                           
                        }
                        
                    }
                    catch{
                        //Catch something
                    }
                }
            }
            task.resume()


            
        }
        return []
    }

}




