COMPILER_PATH = emojicodec

PACKAGE_NAME = emojihttp
PACKAGE_NAMESPACE = 🌐
PACKAGE_DIR = ./packages

SRC_DIR = ./src
TESTS_DIR = ./tests
BUILD_DIR = ./build
DIST_DIR = ./dist

FILE_EXT = .emojic
MAIN_FILE = main
BUILD_FILES = $(SRC_DIR)/$(MAIN_FILE).o
LIB_FILES = $(SRC_DIR)/🏛 $(SRC_DIR)/lib$(PACKAGE_NAME).a

all: build

build:
	@$(COMPILER_PATH) $(SRC_DIR)/$(MAIN_FILE)$(FILE_EXT)
	@mkdir -p $(BUILD_DIR) $(DIST_DIR)
	@mv $(BUILD_FILES) $(BUILD_DIR)
	@mv $(SRC_DIR)/$(MAIN_FILE) $(DIST_DIR)

run: clean_build build
	@$(DIST_DIR)/$(MAIN_FILE)

package:
	@mkdir -p $(PACKAGE_DIR)/$(PACKAGE_NAME)
	@$(COMPILER_PATH) -p $(PACKAGE_NAME) $(SRC_DIR)/$(MAIN_FILE)$(FILE_EXT)
	@mv $(LIB_FILES) $(PACKAGE_DIR)/$(PACKAGE_NAME)
	@rm -rf $(BUILD_FILES)

test: package
	@$(foreach file, $(wildcard $(TESTS_DIR)/*$(FILE_EXT)), \
		echo Running $(notdir $(file))...; \
		cp $(file) $(PACKAGE_DIR); \
		(echo '📦 testtube 🏠'; cat $(SRC_DIR)/*$(FILE_EXT); echo '📦 $(PACKAGE_NAME) $(PACKAGE_NAMESPACE)') | \
			grep -i '^📦\.*' | \
			cat - $(PACKAGE_DIR)/$(notdir $(file)) > test$(FILE_EXT).tmp; \
		mv test$(FILE_EXT).tmp $(PACKAGE_DIR)/$(notdir $(file)); \
		$(COMPILER_PATH) $(PACKAGE_DIR)/$(notdir $(file)) && $(PACKAGE_DIR)/$(basename $(notdir $(file))); \
		rm $(PACKAGE_DIR)/$(basename $(notdir $(file))) $(PACKAGE_DIR)/$(basename $(notdir $(file))).o; \
		echo '\n'; \
	)

clean_all:
	@rm -rf $(BUILD_DIR) $(DIST_DIR) $(PACKAGE_DIR)

clean_build:
	@rm -rf $(BUILD_DIR) $(DIST_DIR)

PHONY: all build run package test clean_all clean_build
