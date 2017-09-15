//
//  ViewController.swift
//  DownloadingImage
//
//  Created by Nikhil Tanappagol on 7/24/17.
//  Copyright © 2017 Nikhil Tanappagol. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-h1nkx1-LtwePxStNgW0_1jRAX7U9mw_PvL7LupbhGBkoPget")!
        let request = NSMutableURLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data , response , error in
            
            if error != nil {
                print(error)
            } else {
                if let data = data {
                    if let Image = UIImage(data: data) {
                        self.imageView.image = Image
                        
                        // now the task is to save the image in the local app data memory
                        let documentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true )
        if documentPath.count > 0 {
                        if let documentDierctory = documentPath[0] as? String {
                            let savePath = documentDierctory + "/Royal.jpg"
                            do {
                           try  UIImageJPEGRepresentation(Image , 1)?.write(to: URL(fileURLWithPath: savePath))
                            } catch {
                                
                                print("Error")
                            }
                            
                        }
                    }
            }
        }
        }
    }
         task.resume()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

