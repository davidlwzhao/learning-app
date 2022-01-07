//
//  ContentDetailView.swift
//  LearningApp
//
//  Created by David Zhao on 07/01/2022.
//

import SwiftUI
import AVKit

struct ContentDetailView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        let lesson = model.currentLesson
        let url = URL(string: Constants.videoHostUrl + (lesson?.video ?? ""))
        
        VStack {
            //Video
            if url != nil {
                VideoPlayer(player: AVPlayer(url: url!))
            }
            
            Text(lesson?.explanation ?? "Nothing found")
            
            if model.hasNextLesson() {
                Button {
                    model.toNextLesson()
                } label: {
                    ZStack{
                        Rectangle()
                            .foregroundColor(.green)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .frame(height: 48)
                        
                        Text("Next Lesson - \(model.currentModule!.content.lessons[model.currentLessonIndex+1].title)")
                            .bold()
                            .foregroundColor(.white)
                    }
                }

            }
        }
        .padding()
        
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
            .environmentObject(ContentModel())
    }
}
