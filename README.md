# Watch Invaders 👾⌚

A classic arcade-style space invaders game for Garmin smartwatches, built with Connect IQ and Monkey C.

![Garmin Fenix 7](https://img.shields.io/badge/Garmin-Fenix%207-green)
![Connect IQ](https://img.shields.io/badge/Connect%20IQ-3.2.0+-blue)
![License](https://img.shields.io/badge/License-MIT-yellow)

## Features

- 🎮 Classic arcade gameplay adapted for smartwatches
- 👾 Green alien invaders that shoot back
- 🚀 Player cannon with limited fire rate
- 💥 Visual flash effects when aliens or player are hit
- 📈 Progressive difficulty with each level
- 💯 Score tracking and lives system
- 📱 Optimized for circular watch displays

## Supported Devices

- Garmin Fenix 7 / 7S / 7X
- Garmin Fenix 6S Pro
- Garmin Venu 2 / 2S
- Garmin Vivoactive 4 / 4S

## Controls

- **Move Left**: Swipe left, tap left side of screen, or use left button
- **Move Right**: Swipe right, tap right side of screen, or use right button
- **Fire**: Press SELECT button or center tap
- **Restart**: Press SELECT when game over

## Game Mechanics

- Maximum of 4 player bullets on screen
- Fire rate limited to prevent bullet spam
- Aliens shoot green bullets randomly
- Player starts with 3 lives
- Aliens speed up with each level
- Game ends when aliens reach the bottom or player loses all lives

## Building from Source

### Prerequisites

- Garmin Connect IQ SDK 8.2.3+
- Monkey C compiler
- Developer key (for signing)

### Setup

1. Clone the repository:
```bash
git clone <repository-url>
cd watch-invaders
```

2. Set up environment:
```bash
source .envrc  # Or set GARMIN_SDK_HOME manually
```

3. Build the app:
```bash
make build     # Debug build
make release   # Release build
```

4. Run in simulator:
```bash
make run       # Build and run
make restart   # Run without rebuilding
```

## Installation

### Method 1: USB Transfer
1. Build: `make release`
2. Connect watch via USB
3. Copy `WatchInvaders.prg` to `GARMIN/APPS/`
4. Safely eject device

### Method 2: Garmin Connect App
1. Build: `make release`
2. Transfer `WatchInvaders.prg` to phone
3. Use Garmin Connect app → Device → Apps → Sideload

See [DEPLOY.md](DEPLOY.md) for detailed installation instructions.

## Development

### Project Structure
```
watch-invaders/
├── source/                  # Monkey C source files
│   ├── WatchInvadersApp.mc    # Application entry
│   ├── WatchInvadersView.mc   # Game logic & rendering
│   └── WatchInvadersDelegate.mc # Input handling
├── resources/              # Assets and resources
├── manifest.xml           # App configuration
├── monkey.jungle          # Build configuration
└── Makefile              # Build automation
```

### Make Commands
- `make build` - Compile debug version
- `make release` - Compile release version
- `make run` - Build and launch simulator
- `make restart` - Launch simulator without rebuilding
- `make clean` - Remove build artifacts
- `make help` - Show all commands

## Technical Details

- **Language**: Monkey C
- **Platform**: Garmin Connect IQ
- **Frame Rate**: 5 FPS (200ms timer)
- **Min SDK**: 3.2.0

## Contributing

Feel free to open issues or submit pull requests for improvements!

## License

MIT License - feel free to use this code for your own projects.

## Acknowledgments

- Classic Space Invaders arcade game for inspiration
- Garmin Connect IQ developer community
- Built with assistance from Claude Code

---

⌚ Made for Garmin smartwatches with ❤️