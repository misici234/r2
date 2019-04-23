//
//  Helper.swift
//  Alarmadillo
//
//  Created by TwoStraws on 21/06/2016.
//  Copyright © 2016 Paul Hudson. All rights reserved.
//

import Foundation

struct Helper {
	static func getDocumentsDirectory() -> URL {
		let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
		let documentsDirectory = paths[0]

		return documentsDirectory
	}
}
