//
//  ChatViewController.swift
//  MessengerApp
//
//  Created by 이성호 on 2021/06/02.
//


import UIKit
import MessageKit

struct Message: MessageType {
    var sender: SenderType
    var messageId: String
    var sentDate: Date
    var kind: MessageKind
}

struct Sender: SenderType{
    var photoURL: String
    var senderId: String
    var displayName: String
}

class ChatViewController: MessagesViewController {
    
    //MARK: Property
    
    var messages = [Message]()
    
    let selfSender = Sender(photoURL: "", senderId: "1", displayName: "Joe Smith")
    
    //MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    //MARK: Configure
    func configure(){
        view.backgroundColor = .systemBackground
        
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        
        messages.append(Message(sender: selfSender, messageId: "1", sentDate: Date(), kind: .text("Hello world message")))
        messages.append(Message(sender: selfSender, messageId: "1", sentDate: Date(), kind: .text("♥️")))
    }
}
    

extension ChatViewController : MessagesDataSource, MessagesLayoutDelegate, MessagesDisplayDelegate {
    func currentSender() -> SenderType {
        return selfSender
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }
    
    
}
