//
//  ChatViewController.swift
//  Chatter
//
//  Created by Harjas Monga on 2/1/18.
//  Copyright © 2018 Harjas Monga. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var newMessageField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var messages: [PFObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.transform = CGAffineTransform(rotationAngle: -(CGFloat)(Double.pi));
        tableView.showsVerticalScrollIndicator = false
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 50

        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(loadMessages), userInfo: nil, repeats: true)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messages[indexPath.row]
        let username: String?
        let user = message["user"] as? PFUser
        if (user != nil) {
            username = user!.username
        } else {
            username = "🤖"
        }
        let cell: ChatCell
        if username == PFUser.current()?.username {
            cell = tableView.dequeueReusableCell(withIdentifier: "ChatCellFromCurrentUser", for: indexPath) as! ChatCell
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: "ChatCell", for: indexPath) as! ChatCell
        }
        cell.messageLabel.text = message["text"] as? String
        cell.messageLabel.sizeToFit()
        cell.usernameLabel.text = username
        cell.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi));

        return cell
    }
    
    @objc func loadMessages() {
        let query = PFQuery(className: "Message")
        query.includeKey("user")
        query.order(byDescending: "createdAt")
        query.findObjectsInBackground { (messages, err) in
            if let err = err {
                print(err.localizedDescription)
            } else {
                self.messages = messages!
                self.tableView.reloadData()
            }
        }

    }
    @IBAction func sendMessage(_ sender: Any) {
        let chatMessage = PFObject(className: "Message")
        chatMessage["text"] = newMessageField.text ?? ""
        chatMessage["user"] = PFUser.current()
        chatMessage.saveInBackground { (success, error) in
            if success {
                print("The message was saved!")
                self.newMessageField.text = ""
            } else if let error = error {
                print("Problem saving message: \(error.localizedDescription)")
            }
        }
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    @objc func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y += keyboardSize.height
            }
        }
 
    }
    @IBAction func logOutUser(_ sender: Any) {
        logOutFunction()
    }
    func logOutFunction() {
        print("logout function called")
        PFUser.logOutInBackground { (error: Error? ) in
        }
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        appDelegate.window?.rootViewController = storyboard.instantiateViewController(withIdentifier: "UnauthorizedViewController")
    }
    @IBAction func userClickerScreen(_ sender: Any) {
        view.endEditing(true)    }
    
}
