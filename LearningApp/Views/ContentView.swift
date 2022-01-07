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
                        
                        NavigationLink(
                            destination:
                                ContentDetailView()
                                    .onAppear(perform: {
                                        model.beginLesson(i)
                                    }),
                            label: {
                                ContentRowView(i: i)
                            })
                        
                    }
                }
            }
            .accentColor(.black)
            .navigationBarTitle("Learn  \(model.currentModule?.category ?? "")")
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let model = ContentModel(1)
        
        ContentView()
            .environmentObject(model)
    }
}
