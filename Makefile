# Makefile for Watch Invaders Garmin Watch App

# Check for required environment variable
ifndef GARMIN_SDK_HOME
$(error GARMIN_SDK_HOME is not set. Please set it to your Connect IQ SDK path)
endif

# Variables
MONKEYC = "$(GARMIN_SDK_HOME)/bin/monkeyc"
MONKEYDO = "$(GARMIN_SDK_HOME)/bin/monkeydo"
DEVICE = fenix7
OUTPUT = WatchInvaders.prg
DEVELOPER_KEY = /Users/farmisen/Projects/fa/garmin/developer_key
JUNGLE_FILE = monkey.jungle

# Default target
.PHONY: all
all: build

# Build the application (debug version)
.PHONY: build
build:
	@echo "Building Watch Invaders for $(DEVICE)..."
	$(MONKEYC) -d $(DEVICE) -f $(JUNGLE_FILE) -o $(OUTPUT) -y $(DEVELOPER_KEY)
	@echo "Build complete: $(OUTPUT)"

# Build release version (no debug info, smaller file)
.PHONY: release
release:
	@echo "Building Watch Invaders RELEASE for $(DEVICE)..."
	$(MONKEYC) -d $(DEVICE) -f $(JUNGLE_FILE) -o $(OUTPUT) -y $(DEVELOPER_KEY) -r
	@echo "Release build complete: $(OUTPUT)"

# Run the application in simulator
.PHONY: run
run: build
	@echo "Starting simulator for $(DEVICE) in background..."
	$(MONKEYDO) $(OUTPUT) $(DEVICE) &
	@echo "Simulator started (PID: $$!)"

# Restart the application in simulator (without rebuilding)
.PHONY: restart
restart:
	@echo "Restarting simulator for $(DEVICE) with existing build in background..."
	$(MONKEYDO) $(OUTPUT) $(DEVICE) &
	@echo "Simulator started (PID: $$!)"

# Clean build artifacts
.PHONY: clean
clean:
	@echo "Cleaning build artifacts..."
	rm -f $(OUTPUT)
	rm -f *.prg.debug.xml
	@echo "Clean complete"

# Help target
.PHONY: help
help:
	@echo "Watch Invaders Garmin App - Makefile targets:"
	@echo "  make build   - Compile the application"
	@echo "  make run     - Build and run in simulator"
	@echo "  make restart - Run in simulator without rebuilding"
	@echo "  make clean   - Remove build artifacts"
	@echo "  make help    - Show this help message"
	@echo ""
	@echo "Required environment variable:"
	@echo "  GARMIN_SDK_HOME - Path to Connect IQ SDK"
	@echo ""
	@echo "Current settings:"
	@echo "  GARMIN_SDK_HOME = $(GARMIN_SDK_HOME)"
	@echo "  Device = $(DEVICE)"
	@echo "  Output = $(OUTPUT)"