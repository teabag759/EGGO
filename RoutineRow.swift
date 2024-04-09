//
//  RoutineRow.swift
//  EGGO
//
//  Created by 이소현 on 3/25/24.
//

import SwiftUI


struct RoutineRow: View {
    var routine: Routine

    var body: some View {
        HStack {
            Text(routine.name)
            Spacer()
            Text("\(routine.time, formatter: itemFormatter)")
        }
    }
}

struct RoutineRow_Previews: PreviewProvider {
    static var previews: some View {
        RoutineRow(routine: Routine(name: "샘플 루틴", isCompleted: false, time: Date()))
            .previewLayout(.sizeThatFits)
    }
}
