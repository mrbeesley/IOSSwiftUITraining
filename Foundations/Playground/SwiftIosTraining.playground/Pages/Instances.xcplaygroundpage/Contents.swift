import SwiftUI
import Foundation

struct DatabaseManager {
    
    private var serverName:String = "Server 1"
    
    
    func saveData(data:String) -> Bool {
        // saves the data and returns bool result
        return true
    }
}

struct ChatView {
    var message = "Hello"
    
    func sendChat() {
        let db:DatabaseManager = DatabaseManager()
        let success = db.saveData(data:message)
        
        // check success and let user know if it failed
        if success {
            print("Message sent!")
        } else {
            print("Message Failed to send!")
        }
    }
}


var chat:ChatView = ChatView()

chat.message = "Hello Michael"
chat.sendChat()

// in this case view is a protocal that contentview must conform to
// it must have a property for body that is some view
// Body is a computre property on a computed property you can omit return if there is only one line
struct ContentView: View {
    var body: some View {
        return Text("Hello, World")
            .padding()
    }
}
