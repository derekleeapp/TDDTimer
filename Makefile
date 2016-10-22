bootstrap:
	@carthage bootstrap --platform iOS

update:
	@carthage update --platform iOS

tests:
	@xcodebuild -project TDDTimer.xcodeproj -scheme "TDDTimer" -sdk iphonesimulator -destination "platform=iOS Simulator,OS=10.0,name=iPhone 6s" clean build test

