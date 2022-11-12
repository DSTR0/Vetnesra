//
//  NASAManagerDelegate.swift
//  Vetnesra
//
//  Created by 1234 on 09.10.2022.
//

import Foundation

protocol NASAManagerDelegate{
    
    func didUpdateImage(nasaManager: NASAManager, nasaModel: NASAModel)
    func didFailWithError(_ error: Error)
    
}
