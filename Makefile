APP_NAME	:= minimal-cocoa-app
APP_BUNDLE	:= $(APP_NAME).app
APP			:= $(APP_BUNDLE)/Contents/MacOS/$(APP_NAME)
APP_ICNS	:= $(APP_BUNDLE)/Contents/Resources/app.icns

.PHONY: run build clean

run: build
	open $(APP_BUNDLE)

build: $(APP) $(APP_ICNS)
	@echo 'Done!'

clean:
	rm -f $(APP) $(APP_ICNS)

$(APP): main.m
	mkdir -p $(shell dirname $@)
	clang -Wall -framework Cocoa -o $@ $<

$(APP_ICNS): app.iconset/*
	mkdir -p $(shell dirname $@)
	iconutil -c icns -o $@ app.iconset
	@echo NB you can safely ignore the above app.iconset warnings
	touch $(APP_BUNDLE) # force Finder to update its cache
