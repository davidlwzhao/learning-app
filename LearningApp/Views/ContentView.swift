//
//  ContentView.swift
//  LearningApp
//
//  Created by David Zhao on 06/01/2022.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model:ContentModel
    
    var body: some View {
        
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 20) {
                
                if model.currentModule != nil {
                    let lessons = model.currentModule!.content.lessons
                    
                    ForEach(0..<lessons.count, id: \.self) { i in
                        ZStack {
                            Rectangle()
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                                .aspectRatio(CGSize(width: 335, height: 80), contentMode: .fit)
                            
                            HStack(spacing: 30){
                                Text("\(i+1)")
                                    //.padding(.horizontal, 25)
                                VStack(alignment: .leading){
                                    Text(lessons[i].title)
                                        .bold()
                                    Text("Video - \(lessons[i].duration) minutes")
                                        .font(Font.system(size: 10))
                                }
                                Spacer()
                            }
                        }
                        .padding(.horizontal, 5)
                    }
                }
            }
            .navigationBarTitle("Learn  \(model.currentModule?.category ?? "")")
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        var model = ContentModel()
        model.beginModule(1)
        
        ContentView()
            .environmentObject(model)
    }
}
