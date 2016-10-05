WORKING_DIR = ./

default: test

build_signal:
	cd $(WORKING_DIR) && \
		pod install && \
		xcodebuild -workspace Signal.xcworkspace -scheme Signal \
		-sdk iphonesimulator \
		build | xcpretty

retest:
	cd $(WORKING_DIR) && \
	xcodebuild -workspace Signal.xcworkspace -scheme Signal \
		-sdk iphonesimulator \
		-destination 'platform=iOS Simulator,name=iPhone 6,OS=10.0' \
		test | xcpretty

test: build_signal retest

