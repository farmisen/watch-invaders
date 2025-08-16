# Watch Invaders - Garmin Watch App

## Project Overview
This is a Watch Invaders game implementation for Garmin smartwatches using the Connect IQ platform.

## Language & Framework
- **Language**: Monkey C
- **Platform**: Garmin Connect IQ SDK
- **SDK Version**: 8.2.3
- **Target Device**: Fenix 7 (and other compatible Garmin devices)

## Development Tools
- **Compiler**: `monkeyc` - Monkey C compiler
- **Simulator**: `monkeydo` - Connect IQ device simulator  
- **SDK Version Required**: 8.2.3 or later
- **Developer Key**: Generate with `openssl genrsa -out developer_key 4096`

## Build Commands
```bash
# Setup environment (copy .envrc.example to .envrc and update paths)
source .envrc

# Compile the app
make build

# Run in simulator
make run

# Build release version
make release
```

## Project Structure
```
watch-invader/
├── source/                 # Monkey C source files
│   ├── SpaceInvadersApp.mc    # Main application entry point
│   ├── SpaceInvadersView.mc   # Game view and logic
│   └── SpaceInvadersDelegate.mc # Input handling
├── resources/             # Resource files
│   ├── drawables/        # Images and icons
│   ├── layouts/          # UI layouts
│   └── strings/          # String resources
├── manifest.xml          # App configuration
├── monkey.jungle         # Project configuration
└── developer_key         # Developer signing key
```

## Documentation & Resources

### Official Documentation
- **Connect IQ Developer Portal**: https://developer.garmin.com/connect-iq/
- **Monkey C API Documentation**: https://developer.garmin.com/connect-iq/api-docs/
- **Programming Guide**: https://developer.garmin.com/connect-iq/programmers-guide/
- **SDK Download**: https://developer.garmin.com/connect-iq/sdk/

### Key API References
- **WatchUi Module**: https://developer.garmin.com/connect-iq/api-docs/Toybox/WatchUi.html
- **Graphics Module**: https://developer.garmin.com/connect-iq/api-docs/Toybox/Graphics.html
- **Timer Module**: https://developer.garmin.com/connect-iq/api-docs/Toybox/Timer.html
- **Application Module**: https://developer.garmin.com/connect-iq/api-docs/Toybox/Application.html

### Tutorials & Guides
- **Getting Started Guide**: https://developer.garmin.com/connect-iq/get-started/
- **Your First App**: https://developer.garmin.com/connect-iq/connect-iq-basics/your-first-app/
- **Monkey C Tutorial**: https://developer.garmin.com/connect-iq/connect-iq-basics/monkey-c/

## Game Features
- Classic Watch Invaders gameplay
- Touch, button, and swipe controls
- Score tracking and level progression
- Adaptive screen sizing for different devices
- Supports multiple Garmin watch models

## Supported Devices
- Fenix 7 series (7, 7S, 7X)
- Fenix 6 series (6, 6 Pro, 6S, 6S Pro, 6X Pro)
- Venu 2 series (Venu 2, Venu 2S)
- Vivoactive 4 series (4, 4S)

## Notes for Future Development
- The app uses the Connect IQ 3.2.0 minimum SDK version
- Timer runs at 200ms intervals (5 FPS) for battery efficiency
- Maximum of 5 bullets on screen at once
- Aliens speed up with each level progression