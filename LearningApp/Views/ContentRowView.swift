//
//  ContentRowView.swift
//  LearningApp
//
//  Created by David Zhao on 07/01/2022.
//

import SwiftUI

struct ContentRowView: View {
    
    @EnvironmentObject var model:ContentModel
    var i: Int
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .aspectRatio(CGSize(width: 335, height: 80), contentMode: .fit)
            
            HStack(spacing: 30){
                Text("\(i+1)")
                    .bold()
                    .padding(.leading, 30)
                    
                VStack(alignment: .leading){
                    Text(model.currentModule!.content.lessons[i].title)
                        .bold()
                    Text("Video - \(model.currentModule!.content.lessons[i].duration) minutes")
                        .font(Font.system(size: 10))
                }
                Spacer()
            }
        }
        .padding(.horizontal, 5)
    }
}

struct ContentRowView_Previews: PreviewProvider {
    static var previews: some View {
        ContentRowView(i: 1)
            .environmentObject(ContentModel())
    }
}
