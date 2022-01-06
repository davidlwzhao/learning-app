//
//  ModuleCardView.swift
//  LearningApp
//
//  Created by David Zhao on 06/01/2022.
//

import SwiftUI

struct ModuleCardView: View {
    
    var image:String
    var title:String
    var description:String
    var lessons:String
    var time: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .aspectRatio(CGSize(width: 335, height: 175), contentMode: .fit)
            
            HStack {
                Image(image)
                    .resizable()
                    .frame(width: 116, height: 116)
                    .clipShape(Circle())
                Spacer()
                VStack(alignment: .leading, spacing: 10) {
                    Spacer()
                    Text(title)
                        .bold()
                    Text(description)
                        .font(.caption)
                    
                    Spacer()
                    HStack {
                        Image(systemName: "text.book.closed")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Text(lessons)
                            .font(Font.system(size: 10))
                        Spacer()
                        Image(systemName: "clock")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Text(time)
                            .font(Font.system(size: 10))
                        
                    }
                    .foregroundColor(Color.gray)
                    Spacer()
                
                }
                .padding(.leading, 20)
            }
            .padding(.horizontal, 20)
        }
    }
}

struct ModuleCardView_Previews: PreviewProvider {
    static var previews: some View {
        let m = ContentModel().modules[0]
        ModuleCardView(image: m.content.image, title: m.category, description: m.content.description, lessons: "10 Lessons", time: "3 hrs")
    }
}
