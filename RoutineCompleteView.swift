//
//  RoutineCompleteView.swift
//  EGGO
//
//  Created by 이소현 on 3/26/24.
//

import SwiftUI

struct RoutineCompleteView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var routineManager: RoutineManager
    var routineName: String
    var buttonTapCount = Count.shared.eggCount
    var onDelete: () -> Void
    
    
    var body: some View {
        VStack {
            Spacer()
            imageView()
                .resizable()
                .scaledToFit()
            Text("\(routineName)을(를) 수행하셨습니다.")
            Spacer()
            Button("오늘도 성공!") {
                onDelete()
                presentationMode.wrappedValue.dismiss()
            }
            .padding()
            .background(Color("customYellow"))
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .navigationBarBackButtonHidden(true)
        .padding()
    }
    
    func imageView() -> Image {
        switch Count.shared.eggCount {
        case 1: return Image("SecondEGGO")
        case 2: return Image("ThirdEGGO")
        case 3: return Image("FourthEGGO")
        case 4: return Image("SixthEGGO")
        case 5: return Image("SeventhEGGO")
        case 6: return Image("EighthEGGO")
        case 7: return Image("LastEGGO")
        default: return Image("LastEGGO")
        }
    }
    
    
}



struct RoutineCompleteView_Previews: PreviewProvider {
    static var previews: some View {
        let routineManager = RoutineManager()
        RoutineCompleteView(routineManager: routineManager, routineName: "샘플 루틴", buttonTapCount: 7, onDelete: {})
    }
}

