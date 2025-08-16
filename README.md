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

1. **Install Garmin Connect IQ SDK:**
   - Visit [Garmin Developer Portal](https://developer.garmin.com/connect-iq/sdk/)
   - Download SDK for your platform (macOS/Windows/Linux)
   - Follow the [installation guide](https://developer.garmin.com/connect-iq/connect-iq-basics/getting-started/)

2. **Generate a developer key:**
   ```bash
   openssl genrsa -out developer_key 4096
   ```

### Setup

1. Clone the repository:
```bash
git clone https://github.com/farmisen/watch-invaders.git
cd watch-invaders
```

2. Configure environment:
```bash
cp .envrc.example .envrc
# Edit .envrc to set your SDK path
source .envrc
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

### USB Transfer (Recommended)

#### macOS Users
macOS requires [OpenMTP](https://openmtp.ganeshrvel.com/) for MTP device access:
```bash
# Install OpenMTP via Homebrew
brew install --cask openmtp

# Build and transfer
make release
# Open OpenMTP, connect watch, navigate to GARMIN/APPS
# Drag and drop WatchInvaders.prg
```

#### Windows/Linux Users
```bash
make release
# Connect watch via USB (appears as drive)
# Copy WatchInvaders.prg to GARMIN/APPS/
# Safely eject
```

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