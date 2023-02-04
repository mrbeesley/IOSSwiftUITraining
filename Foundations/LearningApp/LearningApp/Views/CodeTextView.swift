//
//  CodeTextView.swift
//  LearningApp
//
//  Created by Michael Beesley on 1/19/23.
//

import SwiftUI

struct CodeTextView: UIViewRepresentable {
    
    @EnvironmentObject var model: ContentModel
    
    
    func makeUIView(context: Context) -> UITextView {
        
        let textView = UITextView()
        textView.isEditable = false
        return textView
    }
    
    func updateUIView(_ textView: UITextView, context: Context) {
        
        // Set the attributed text for the lesson
        textView.attributedText = model.codeText
        
        // Scroll back to the top
        textView.scrollRectToVisible(CGRect(x:0, y:0, width: 1, height: 1), animated: false)
    }
}

struct CodeTextView_Previews: PreviewProvider {
    static var previews: some View {
        CodeTextView().environmentObject(CodeTextView_Previews.prepareModel())
    }
    
    static func prepareModel() -> ContentModel {
        let model = ContentModel()
        model.beginModule(1)
        model.beginLesson(0)
        return model
    }
}
