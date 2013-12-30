APP_NAME := minimal-cocoa-app
APP_DIR := $(APP_NAME).app/Contents/MacOS
APP := $(APP_DIR)/$(APP_NAME)

.PHONY: run build clean

run: $(APP)
	open $(APP_NAME).app

build: $(APP)
	@echo 'Done!'

clean:
	rm -f $(APP)

$(APP): main.m
	@mkdir -p $(APP_DIR)
	clang -Wall -framework Cocoa -o $(APP) main.m
