//
//  ViewController.swift
//  TV Remote
//
//  Created by Claude on 01/04/2020.
//  Copyright © 2020 Claude Peris. All rights reserved.
//

//http://ip_livebox_tv:8080/remoteControl/cmd?operation=01&key=code_touche&mode=numéro_mode


//numéro_mode :
//0 : envoi unique de touche
//1 : appui prolongé de touche
//2 : relacher la touche après un appui prolongé
//
//code_touche :
//116 : ON/OFF
//512 : 0
//513 : 1
//514 : 2
//515 : 3
//516 : 4
//517 : 5
//518 : 6
//519 : 7
//520 : 8
//521 : 9
//402 : CH+
//403 : CH-
//115 : VOL+
//114 : VOL-
//113 : MUTE
//103 : UP
//108 : DOWN
//105 : LEFT
//106 : RIGHT
//352 : OK
//158 : BACK
//139 : MENU
//164 : PLAY/PAUSE
//168 : FBWD
//159 : FFWD
//167 : REC
//393 : VOD

import Cocoa
import WebKit

class ViewController: NSViewController {
    
    let decodeur_ip = "192.168.1.10"
    
    
    @IBOutlet var box: NSView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.wantsLayer = true

        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear() {
        box.layer?.backgroundColor = NSColor.black.cgColor
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

