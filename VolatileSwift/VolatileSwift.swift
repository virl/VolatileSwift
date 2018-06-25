//
//  VolatileSwift.swift
//  VolatileSwift
//
//  Created by Virl on 25/06/2018.
//  Copyright © 2018 Volatile. All rights reserved.
//

import Foundation

class Bar
{
	let baz = "Hello world!"
}

class Foo
{
	var bar = Bar()
}

let globalFoo = Foo()

class VolatileSwift
{
	func start()
	{
		for _ in 1...1000 {
			launchReader()
		}
		
		for _ in 1...1000 {
			launchWriter()
		}
		
		let _ = readLine()
	}
	
	private func launchReader()
	{
		let thread = Thread {
			while(true) {
				autoreleasepool(invoking: { () -> Void in
					let baz = globalFoo.bar.baz
				})
			}
		}
		thread.start()
	}
	
	private func launchWriter()
	{
		let thread = Thread {
			while(true) {
				autoreleasepool(invoking: { () -> Void in
					globalFoo.bar = Bar()
				})
			}
		}
		thread.start()
	}
}
