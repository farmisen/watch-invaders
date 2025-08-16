# Deploying Watch Invaders to Your Garmin Watch

## Prerequisites

1. **Install the Garmin Connect IQ SDK:**
   - Visit https://developer.garmin.com/connect-iq/sdk/
   - Download the SDK for your platform
   - Follow the installation instructions

2. **Generate a developer key:**
   ```bash
   openssl genrsa -out developer_key 4096
   ```

3. **Setup environment:**
   ```bash
   cp .envrc.example .envrc
   # Edit .envrc to set your SDK path
   source .envrc
   ```

## Method 1: Using USB Cable (Direct Transfer)

### For macOS Users
macOS doesn't natively support MTP (Media Transfer Protocol). Use **OpenMTP**:

1. **Install OpenMTP:**
   - Download from https://openmtp.ganeshrvel.com/
   - Or install via Homebrew: `brew install --cask openmtp`

2. **Build the release version:**
   ```bash
   make release
   ```

3. **Transfer the app:**
   - Connect your watch via USB
   - Open OpenMTP
   - Navigate to GARMIN/APPS folder
   - Drag and drop `WatchInvaders.prg`
   - Safely disconnect

### For Windows/Linux Users

1. **Build the release version:**
   ```bash
   make release
   ```

2. **Transfer the app:**
   - Connect your watch via USB
   - It should appear as a removable drive
   - Copy `WatchInvaders.prg` to GARMIN/APPS folder
   - Safely eject the device

## Method 2: Using Connect IQ Store (Developer Preview)

1. **Build the release version:**
   ```bash
   source .envrc
   make release
   ```

2. **Upload to Connect IQ Developer Portal:**
   - Go to https://apps.garmin.com/en-US/developer/upload
   - Log in with your Garmin developer account
   - Upload the .prg file as a beta/test app
   - Install it from the Connect IQ app on your phone

## Running the Game on Your Watch

1. Press the START button on your watch
2. Scroll to find "Watch Invaders" in your apps list
3. Select it to start playing

## Controls on Watch

- **Left/Right:** Swipe left/right or use buttons
- **Fire:** Tap screen or press SELECT button
- **Restart:** Press SELECT when game is over

## Troubleshooting

- If the app doesn't appear, restart your watch
- Make sure your watch firmware is up to date
- Verify the device is listed in manifest.xml (fenix7, fenix7s, fenix7x)
- Check that the .prg file size is reasonable (should be under 1MB)