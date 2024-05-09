//
//  TrendView.swift
//  MyMovie
//
//  Created by 민지은 on 2024/05/09.
//

import SwiftUI

struct TrendView: View {
    
    let tv: TV
    
    var body: some View {
        VStack(alignment: .leading){
            Text(tv.name)
                .asGrayTitleFont()
            
            Text(tv.name)
                .asBlackTitleFont()
            
            ZStack {
                Image("poster")
                    .resizable()
                
                VStack {
                    Spacer()
                    VStack {
                        HStack(spacing: 0) {
                            Text("평점")
                                .padding(6)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .background(.orange)
                            Text("3.3")
                                .padding(6)
                                .background(.white)
                            
                            Spacer()
                        }
                        .padding(.leading, 15)
                    }
                    .padding(.bottom, 10)
                    
                    ZStack {
                        
                        Rectangle()
                            .fill(Color.white)
                            .frame(width: 350, height: 120)
                        
                        
                        VStack(alignment: .leading){
                            Text(tv.name)
                                .asBlackTitleFont()
                            
                            Text(tv.name)
                                .asGrayTitleFont()
                                .padding(.bottom, 10)
                            
                            thinLine(.black)
                            
                            HStack {
                                Text("자세히 보기")
                                    .font(.system(size: 14))
                                    .fontWeight(.regular)
                                Spacer()
                                Image(systemName: "chevron.right")
                            }
                        }
                        .padding(.horizontal, 20)
                        
                    }
                }
                
            }
            .frame(width: 350, height: 350)
            .cornerRadius(15)
            .shadow(color: .gray, radius: 5, x: 0.0, y: 0.0)
            
        }
        
    }
    
    func thinLine(_ color: Color) -> some View {
        Rectangle()
            .fill(color)
            .frame(width: .infinity, height: 1)
            .padding(.bottom, 10)
    }
}
