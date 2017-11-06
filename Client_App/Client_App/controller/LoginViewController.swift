//
//  LoginViewController.swift
//  Client_App
//
//  Created by Phạm Sơn on 10/31/17.
//  Copyright © 2017 Phạm Sơn. All rights reserved.
//

import UIKit
import SocketIO
var socket : SocketIOClient!
class LoginViewController: UIViewController {
    
    @IBOutlet weak var txtUsernameLogin: UITextField!
    
    @IBOutlet weak var txtPasswordLogin: UITextField!
    
    @IBOutlet weak var btnLogin: UIButton!
    
    @IBAction func btnLoginForm(_ sender: Any) {
       
//        let username = txtUsernameLogin.text!
//        let password = txtPasswordLogin.text!
//        socket.emit("client-send-username",username)
//        socket.emit("client-send-password",password)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background-login")!)
        btnLogin.backgroundColor = UIColor.white
        btnLogin.layer.cornerRadius = 8
        socket = SocketIOClient(socketURL: URL(string: "http://192.168.1.2:3000")!, config: [.log(true), .compress])
        socket.on("server-send-alertUsername") { (data, ack) in
            print(data[0])
        }
        socket.on("server-send-login") { (data, ack) in
            
        }
        socket.connect()
        
    }
}
