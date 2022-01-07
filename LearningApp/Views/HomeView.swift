//
//  ContentView.swift
//  LearningApp
//
//  Created by David Zhao on 03/01/2022.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .leading) {
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Get Started")
                        .font(.largeTitle)
                        .bold()
                    Text("What would you like to do today?")
                    
                }
                
                ScrollView {
                    LazyVStack {
                        ForEach(model.modules) { m in
                            NavigationLink {
                                ContentView()
                                    .onAppear {
                                        model.beginModule(m.id)
                                    }
                            } label: {
                                ModuleCardView(image: m.content.image, title: "Learn \(m.category)", description: m.content.description, lessons: "\(m.content.lessons.count) Lessons", time: m.content.time)
                            }

                            ModuleCardView(image: m.test.image, title: "\(m.category) Test", description: m.test.description, lessons: "\(m.test.questions.count) Questions", time: m.test.time)
                            
                        }
                    }
                    .accentColor(.black)
                }
                
            }
            .frame(maxWidth: .infinity)
        .padding(.horizontal, 20)
        }
        .navigationViewStyle(.stack)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
