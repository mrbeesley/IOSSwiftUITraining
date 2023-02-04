//
//  TestResultView.swift
//  LearningApp
//
//  Created by Michael Beesley on 1/25/23.
//

import SwiftUI

struct TestResultView: View {
    
    @EnvironmentObject var model: ContentModel
    var numCorrect : Int
    
    var body: some View {
        
        if model.currentModule != nil {
            VStack {
                Spacer()
                
                Text(resultHeading)
                    .font(.title)
                
                Spacer()
                
                Text("You got \(numCorrect) out of \(model.currentModule?.test.questions.count ?? 0) questions!")
                
                Spacer()
                
                Button {
                    model.currentTestSelected = nil
                } label: {
                    RectangleCardView(
                        backColor: Color.green,
                        foreColor: Color.white,
                        text: "Complete")
                }.padding()
                
                Spacer()
            }
        }
    }
    
    var resultHeading : String {
        let pct = Double(numCorrect) / Double(model.currentModule!.test.questions.count)
        
        if pct > 0.5 {
            return "Awesome Work!"
        }
        else if pct > 0.2 {
            return "Doing Great!"
        }
        else {
            return "Keep Learning!"
        }
    }
}

struct TestResultView_Previews: PreviewProvider {
    static var previews: some View {
        TestResultView(numCorrect: 6).environmentObject(prepareModel())
    }
    
    static func prepareModel() -> ContentModel {
        let model = ContentModel()
        model.beginTest(1)
        return model
    }
}
