//
//  ContentDetailView.swift
//  LearningApp
//
//  Created by Michael Beesley on 1/19/23.
//

import SwiftUI
import AVKit

struct ContentDetailView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        let lesson = model.currentLesson
        let url = URL(string: Constants.videoHostUrl + (lesson?.video ?? ""))
        
        VStack {
            if url != nil {
                VideoPlayer(player: AVPlayer(url: url!))
                    .cornerRadius(10)
            }
            
            // TODO: Description
            CodeTextView()
            
            // Next Lesson Button, only if there is next lesson
            if model.hasNextLesson() {
                Button(action: {
                    model.nextLesson()
                }, label: {
                    
                    RectangleCardView(
                        backColor: Color.green,
                        foreColor: Color.white,
                        text: "Next Lesson: \(model.currentModule!.content.lessons[model.currentLessonIndex + 1].title)")
                })
            }
            else {
                Button(action: {
                    // Take the user back to the home view
                    model.currentContentSelected = nil
                }, label: {

                    RectangleCardView(
                        backColor: Color.green,
                        foreColor: Color.white,
                        text: "Complete!")
                    
                })
            }
            
        }
            .padding()
            .navigationTitle(lesson?.title ?? "")
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView().environmentObject(ContentDetailView_Previews.prepareModel())
    }
    
    static func prepareModel() -> ContentModel {
        let model = ContentModel()
        model.beginModule(1)
        model.beginLesson(0)
        return model
    }
}
