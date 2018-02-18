//
//  ActiveTask.swift
//  SampleResearchKit
//
//  Created by Simon Ng on 3/5/2017.
//  Copyright © 2017 AppCoda. All rights reserved.
//

import Foundation
import ResearchKit

public var ActiveTask: ORKOrderedTask {
    return ORKOrderedTask.shortWalk(withIdentifier: "Gait Test", intendedUseDescription: "Measure Gait", numberOfStepsPerLeg: 20, restDuration: 60.0, options: ORKPredefinedTaskOption())
}
