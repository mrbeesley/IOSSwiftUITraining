//
//  ContentModel.swift
//  LearningApp
//
//  Created by Michael Beesley on 1/13/23.
//

import Foundation

class ContentModel : ObservableObject {
    
    // HTML content and Style Data
    var styleData: Data?
    @Published var codeText = NSAttributedString()
    
    // List of all modules
    @Published var modules = [Module]()
    
    // Selected Module
    @Published var currentModule: Module?
    var currentLessonIndex = 0
    
    // Selected Lesson
    @Published var currentLesson: Lesson?
    var currentModuleIndex =  0
    
    // Current Question
    @Published var currentQuestion: Question?
    var currentQuestionIndex = 0
    
    // Cuyrrent Selected content and test
    @Published var currentContentSelected: Int?
    @Published var currentTestSelected: Int?
    
    init() {
        
        // parse local included json data
        getLocalData()
        
        // Download remote json file and parse data
        getRemoteData()
    }
    
    // MARK: - Data Methods
    
    func getLocalData() {
        // get a url to the json file
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        
        // read the file into data objecct
        do {
            let jsonData = try Data(contentsOf: jsonUrl!)
            
            let jsonDecoder = JSONDecoder()
            
            let data = try jsonDecoder.decode([Module].self, from: jsonData)
            
            // assign parsed data to the modules property
            modules = data
            
        }
        catch {
            // TODO log the error
            print("Couldn't parse loca data")
        }
        
        // parse the style data
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do {
            let data = try Data(contentsOf: styleUrl!)
            styleData = data
            
        }
        catch {
            print("Couldn't parse style data")
        }
        
    }
    
    func getRemoteData() {
        
        let urlString = "https://codewithchris.github.io/learningapp-data/data2.json"
        
        let url = URL(string: urlString)
        
        guard url != nil else {
            // couldn't parse url
            return
        }
        
        let request = URLRequest(url: url!)
        
        // get the session and kick off the task
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            
            // check if there is an error
            guard error == nil else {
                // there was an error
                return
            }
            
            // Handle the response
            
            do {
                let decoder = JSONDecoder()
                let moduleData = try decoder.decode([Module].self, from: data!)
                DispatchQueue.main.async {
                    self.modules += moduleData
                }
                
            }
            catch {
                // couldn't parse json
            }
            
            
        }
        
        dataTask.resume()
        
        
    }
    
    // MARK: - Module Navigation Methods
    
    func beginModule(_ moduleId:Int) {
        
        // find the index for this moduleid
        for index in 0..<modules.count {
            if modules[index].id == moduleId {
                currentModuleIndex = index
                break
            }
        }
        
        // set the current module
        currentModule = modules[currentModuleIndex]
        
    }
    
    // MARK: - Lesson Navigation Method
    
    func beginLesson(_ lessonIndex:Int) {
        
        // Check that the incex doesn't exceed the array
        if lessonIndex < currentModule!.content.lessons.count {
            currentLessonIndex = lessonIndex
        }
        else {
            currentLessonIndex = 0
        }
        
        // Set the current lesson
        currentLesson = currentModule!.content.lessons[currentLessonIndex]
        codeText = addStyling(currentLesson!.explanation)
        
    }
    
    func nextLesson() {
        
        if hasNextLesson() {
            beginLesson(currentLessonIndex + 1)
        }
    }
    
    func hasNextLesson() -> Bool {
        
        if let mod = currentModule {
            return (currentLessonIndex + 1) < mod.content.lessons.count
        }
        
        return false
    }
    
    func beginTest(_ moduleId:Int) {
        
        // set the module
        beginModule(moduleId)
        
        // set the current question
        currentQuestionIndex = 0
        
        // if there are questions set the current question to the first one
        if currentModule?.test.questions.count ?? 0 > 0 {
            
            currentQuestion = currentModule!.test.questions[currentQuestionIndex]
            // Set the question content
            codeText = addStyling(currentQuestion!.content)
            
            
        }
        
    }
    
    func nextQuestion() {
        
        let totalQuestions = currentModule?.test.questions.count ?? 0
        currentQuestionIndex += 1
        
        if currentQuestionIndex < totalQuestions {
            currentQuestion = currentModule!.test.questions[currentQuestionIndex]
            codeText = addStyling(currentQuestion!.content)
            
        }
        else {
            currentQuestionIndex = 0
            currentQuestion = nil
            
        }
    }
    
    func hasNextQuestion() -> Bool {
        let totalQuestions = currentModule?.test.questions.count ?? 0
        
        if totalQuestions > 0 && currentQuestionIndex + 1 < totalQuestions {
            return true
        }
        
        return false
    }
    
    // MARK: - Code Styling
    
    private func addStyling(_ htmlString: String) -> NSAttributedString {
        
        var resultString = NSAttributedString()
        var data = Data()
        
        // Add the styling data
        if styleData != nil {
            data.append(self.styleData!)
        }
        
        // add the html data
        data.append(Data(htmlString.utf8))
        
        // convert to attributed string
        
        if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
            resultString = attributedString
        }
        
        return resultString
    }
}
