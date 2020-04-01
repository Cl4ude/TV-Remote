//
//  ViewController.swift
//  TV Remote
//
//  Created by Claude on 01/04/2020.
//  Copyright © 2020 Claude Peris. All rights reserved.
//

import Cocoa
import WebKit

class ViewController: NSViewController {
    
    let decodeur_ip = "192.168.1.10"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func sendKey( key:String){
        var request = URLRequest(url: URL(string: "http://"+decodeur_ip+":8080/remoteControl/cmd?operation=01&key="+key+"&mode=0")!)
        request.httpMethod = "GET"
        let session = URLSession.shared
        
        session.dataTask(with: request) {data, response, err in
            print(data, response, err)
            }.resume()
    }

    @IBAction func buttonPressed(_ sender: Any) {
        guard let button = sender as? NSButton else {
            return
        }
        
        print (button.tag)
        
        
        
        sendKey(key: "\(button.tag)")
    }
    
}

