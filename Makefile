bootstrap:
	@carthage bootstrap --platform iOS

update:
	@carthage update --platform iOS

tests:
	@xcodebuild -project TDDTimer.xcodeproj -scheme "TDDTimer" -sdk iphonesimulator -destination "platform=iOS Simulator,OS=11.1,name=iPhone 7" clean build test
