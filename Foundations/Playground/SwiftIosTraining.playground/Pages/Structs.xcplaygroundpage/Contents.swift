//: [Previous](@previous)

import Foundation

struct ChatView {
    
    // Properties
    var messasge:String = ""
    var prefix:String = "Chris Says: "
    
    // computed property
    var messageWithPrefix:String {
        prefix + messasge
    }
    
    // view code for this screen
    
    // Methods
    func sendChat() {
        // code to send chat message
        
        print(messageWithPrefix)
    }
    
    func deleteChat() {
        print(messasge)
    }
}
