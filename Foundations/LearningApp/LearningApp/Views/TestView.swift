//
//  TestView.swift
//  LearningApp
//
//  Created by Michael Beesley on 1/20/23.
//

import SwiftUI

struct TestView: View {
    
    @EnvironmentObject var model: ContentModel
    @State var selectedAnswerIndex: Int?
    @State var numCorrect = 0
    @State var submitted = false
    @State var showResults = false
    
    var body: some View {
        
        if model.currentQuestion != nil && showResults == false {
            
            VStack (alignment: .leading) {
                
                // Question Number
                Text("Question \(model.currentQuestionIndex + 1) of \(model.currentModule?.test.questions.count ?? 0)")
                    .padding(.leading, 20)
                
                // Question
                CodeTextView()
                    .padding(.horizontal, 20)
                
                // Answers
                ScrollView {
                    VStack {
                        ForEach (0..<model.currentQuestion!.answers.count, id: \.self) { index in
                            
                            Button {
                                // track the selected index
                                selectedAnswerIndex = index
                            } label: {
                                if submitted == false {
                                    RectangleCardView(
                                        backColor: index == selectedAnswerIndex ? Color.gray : Color.white,
                                        text: model.currentQuestion!.answers[index])
                                }
                                else if index == selectedAnswerIndex {
                                    if index == model.currentQuestion!.correctIndex {
                                        RectangleCardView(
                                            backColor: Color.green,
                                            foreColor: Color.white,
                                            text: model.currentQuestion!.answers[index])
                                    }
                                    else {
                                        RectangleCardView(
                                            backColor: Color.red,
                                            foreColor: Color.white,
                                            text: model.currentQuestion!.answers[index])
                                    }
                                    
                                }
                                else if index == model.currentQuestion!.correctIndex {
                                    RectangleCardView(
                                        backColor: Color.green,
                                        foreColor: Color.white,
                                        text: model.currentQuestion!.answers[index])
                                }
                                else {
                                    RectangleCardView(
                                        text: model.currentQuestion!.answers[index])
                                }
                            }
                            .disabled(submitted)
                            
                        }
                    }
                    .padding()
                }
                
                // Button
                Button {
                    
                    if submitted {
                        
                        if model.hasNextQuestion() {
                            model.nextQuestion()
                            submitted = false
                            selectedAnswerIndex = nil
                        }
                        else {
                            showResults = true
                        }
                        
                    }
                    else {
                        // change submitted state to true disable answers
                        submitted = true
                        
                        // check answer and increment counter if correct
                        if selectedAnswerIndex == model.currentQuestion!.correctIndex {
                            numCorrect += 1
                        }
                    }
                    
                    
                    
                } label: {
                    RectangleCardView(
                        backColor: Color.green,
                        foreColor: Color.white,
                        text: buttonText)
                    .padding()
                }
                .disabled(selectedAnswerIndex == nil)
                
            }
            .navigationTitle("\(model.currentModule?.category ?? "") Test")
        }
        else if showResults {
            TestResultView(numCorrect: numCorrect)
        }
        else
        {
            ProgressView()
        }
    }
    
    var buttonText: String {
        // check if answer has been submitted
        if submitted {
            if model.hasNextQuestion() {
                return "Next"
            } else
            {
                return "Finish"
            }
            
        } else {
            return "Submit"
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView().environmentObject(TestView_Previews.prepareModel())
    }
    
    static func prepareModel() -> ContentModel {
        let model = ContentModel()
        model.beginTest(1)
        return model
    }
}
