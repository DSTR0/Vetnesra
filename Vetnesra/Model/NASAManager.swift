//
//  NASAManager.swift
//  Vetnesra
//
//  Created by 1234 on 09.10.2022.
//

import Foundation

struct NASAManager{
    
    var delegate: NASAManagerDelegate?
    
    let url = "https://api.nasa.gov/planetary/apod?api_key=aV5UvmZqpEAiJPpeF9YsOjAn4Am9CxMJOm4RhlwY"

    func getImage() {
        
        print("before request")
        
        performRequest(url)
        
        print("after request")
        
    }
    
    func performRequest(_ urlString: String){
        
        if let url = URL(string: urlString){
            
            let urlSession = URLSession(configuration: .default)
            
            let dataTask = urlSession.dataTask(with: url){ (data, response, error) in
                
                if error != nil {
                    
                    delegate?.didFailWithError(error!)
                    return
                    
                }
                
                if let safeData = data{
                    
                    if let nasaModel = parseJSON(safeData){
                        
                        delegate?.didUpdateImage(nasaManager: self, nasaModel: nasaModel)
                        
                    }
                    
                }
                
            }
            
            dataTask.resume()
            
        }
        
    }
    
    func parseJSON(_ nasaData: Data) -> NASAModel?{
        
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(NASAData.self, from: nasaData)
            
            let nasaModel = NASAModel(title: decodedData.title, url: decodedData.url)
            
            return nasaModel
            
        }
        catch{
            print(error)
            return nil
        }
        
    }
    
    

}
