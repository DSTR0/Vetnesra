//
//  ViewController.swift
//  Vetnesra
//
//  Created by 1234 on 02.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var nasaManager = NASAManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nasaManager.delegate = self

        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var nasaImageView: UIImageView!
    @IBOutlet weak var nasaLabel: UILabel!
    
    @IBAction func nasaButtonPressed(_ sender: UIButton) {
        
        nasaManager.getImage()
    }
    
    @IBAction func quizButtonPressed(_ sender: Any) {
        
        self.performSegue(withIdentifier: "goToQuiz", sender: self)
        
    }

    
}

//MARK: - NASAManagerDelegate

extension ViewController: NASAManagerDelegate{
    func didUpdateImage(nasaManager: NASAManager, nasaModel: NASAModel) {
        DispatchQueue.main.async {
            self.nasaLabel.text = nasaModel.title
            self.nasaImageView.load(url: nasaModel.url)
            
        }
    }
    
    func didFailWithError(_ error: Error) {
        print(error)
    }
    
    
}

extension UIImageView {
    func load(url: String) {
        DispatchQueue.global().async { [weak self] in
            
            if let url = URL(string: url){
            
                if let data = try? Data(contentsOf: url) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self?.image = image
                        }
                    }
                }
            }
        }
    }
}

