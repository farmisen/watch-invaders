# Deploying Watch Invaders to Your Garmin Watch

## Method 1: Using Garmin Connect Mobile App (Recommended)

1. **Build the release version:**
   ```bash
   source .envrc
   make release
   ```

2. **Transfer the .prg file to your phone:**
   - The file `WatchInvaders.prg` is now ready
   - Send it to your phone via AirDrop, email, or cloud storage

3. **Install using Garmin Connect app:**
   - Open the Garmin Connect app on your phone
   - Connect your watch via Bluetooth
   - Navigate to Device Settings → Apps
   - Select "Upload" or "Sideload Apps"
   - Choose the WatchInvaders.prg file
   - The app will transfer to your watch

## Method 2: Using USB Cable and Garmin Express

1. **Build the release version:**
   ```bash
   source .envrc
   make release
   ```

2. **Connect your watch via USB:**
   - Plug your Fenix 7 into your computer
   - It should appear as a removable drive

3. **Copy the app:**
   - Navigate to the GARMIN/APPS folder on your watch
   - Copy `WatchInvaders.prg` to this folder
   - Safely eject your watch

## Method 3: Using Connect IQ Store (Developer Preview)

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