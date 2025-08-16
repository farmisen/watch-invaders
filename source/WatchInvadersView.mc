using Toybox.WatchUi;
using Toybox.Graphics;
using Toybox.System;
using Toybox.Timer;

class WatchInvadersView extends WatchUi.View {

    var playerX;
    var bullets = [];
    var alienBullets = [];
    var aliens = [];
    var alienDir = 1;
    var alienSpeed = 20;
    var alienStepDown = 10;
    var alienShootChance = 0.02;
    var score = 0;
    var level = 1;
    var lives = 3;
    var gameOver = false;
    var gameTimer;
    var playerHitFlash = 0;  // Flash countdown for player hit
    var alienHitFlash = [];   // Array to track alien hit flashes
    var fireCooldown = 0;     // Cooldown timer to limit fire rate

    function initialize() {
        View.initialize();
    }

    function onLayout(dc) {
        setLayout(Rez.Layouts.MainLayout(dc));
    }

    function onShow() {
        resetGame();
        gameTimer = new Timer.Timer();
        gameTimer.start(method(:timerCallback), 200, true);
    }

    function onHide() {
        if (gameTimer != null) {
            gameTimer.stop();
            gameTimer = null;
        }
    }

    function resetGame() {
        var deviceSettings = System.getDeviceSettings();
        playerX = deviceSettings.screenWidth / 2;
        bullets = [];
        alienBullets = [];
        aliens = [];
        alienHitFlash = [];
        score = 0;
        level = 1;
        lives = 3;
        gameOver = false;
        playerHitFlash = 0;
        fireCooldown = 0;
        createAliens();
    }

    function createAliens() {
        var deviceSettings = System.getDeviceSettings();
        var screenWidth = deviceSettings.screenWidth;
        var alienSpacing = screenWidth / 10;
        
        aliens = [];
        for (var row = 0; row < 4; row++) {
            for (var col = 0; col < 8; col++) {
                aliens.add({
                    "x" => 20 + col * alienSpacing,
                    "y" => 60 + row * 20,  // Moved down further to avoid overlapping with score
                    "alive" => true,
                    "flash" => 0  // Flash countdown
                });
            }
        }
    }

    function timerCallback() as Void {
        updateGame();
    }
    
    function updateGame() {
        if (gameOver) {
            return;
        }

        var deviceSettings = System.getDeviceSettings();
        var screenWidth = deviceSettings.screenWidth;
        var screenHeight = deviceSettings.screenHeight;

        var bulletsToRemove = [];
        for (var i = 0; i < bullets.size(); i++) {
            var b = bullets[i];
            b["y"] = b["y"] - 8;
            if (b["y"] < 0) {
                bulletsToRemove.add(b);
            }
        }
        
        for (var i = 0; i < bulletsToRemove.size(); i++) {
            bullets.remove(bulletsToRemove[i]);
        }

        var moveDown = false;
        for (var i = 0; i < aliens.size(); i++) {
            var a = aliens[i];
            if (!a["alive"]) {
                continue;
            }
            a["x"] = a["x"] + (alienDir * 5);
            if (a["x"] > screenWidth - 20 || a["x"] < 20) {
                moveDown = true;
            }
        }

        if (moveDown) {
            alienDir *= -1;
            for (var i = 0; i < aliens.size(); i++) {
                var a = aliens[i];
                if (!a["alive"]) {
                    continue;
                }
                a["y"] = a["y"] + alienStepDown;
                if (a["y"] > screenHeight - 40) {
                    gameOver = true;
                }
            }
        }

        // Alien shooting logic
        for (var i = 0; i < aliens.size(); i++) {
            var a = aliens[i];
            if (a["alive"] && Math.rand() % 1000 < alienShootChance * 1000) {
                if (alienBullets.size() < 3 + level) {
                    alienBullets.add({ "x" => a["x"], "y" => a["y"] + 6 });
                }
            }
        }

        // Update alien bullets
        var alienBulletsToRemove = [];
        for (var i = 0; i < alienBullets.size(); i++) {
            var ab = alienBullets[i];
            ab["y"] = ab["y"] + 4;
            if (ab["y"] > screenHeight) {
                alienBulletsToRemove.add(ab);
            }
            
            // Check collision with player (player is 20 wide at base, centered at playerX)
            if (ab["x"] >= playerX - 10 && ab["x"] <= playerX + 10 &&
                ab["y"] >= screenHeight - 35 && ab["y"] <= screenHeight - 20) {
                alienBulletsToRemove.add(ab);
                lives--;
                playerHitFlash = 5;  // Flash for 5 frames (1 second at 5 FPS)
                if (lives <= 0) {
                    gameOver = true;
                }
            }
        }
        
        for (var i = 0; i < alienBulletsToRemove.size(); i++) {
            alienBullets.remove(alienBulletsToRemove[i]);
        }

        for (var i = 0; i < bullets.size(); i++) {
            var b = bullets[i];
            for (var j = 0; j < aliens.size(); j++) {
                var a = aliens[j];
                if (!a["alive"]) {
                    continue;
                }
                // Check if bullet hits alien (alien is 12x12, bullet is 2x6)
                if (b["x"] >= a["x"] - 6 && b["x"] <= a["x"] + 6 &&
                    b["y"] >= a["y"] - 6 && b["y"] <= a["y"] + 6) {
                    a["alive"] = false;
                    a["flash"] = 5;  // Flash for 5 frames (1 second at 5 FPS)
                    bulletsToRemove.add(b);
                    score += 10;
                    break;
                }
            }
        }
        
        for (var i = 0; i < bulletsToRemove.size(); i++) {
            bullets.remove(bulletsToRemove[i]);
        }

        var allDead = true;
        for (var i = 0; i < aliens.size(); i++) {
            if (aliens[i]["alive"]) {
                allDead = false;
                break;
            }
        }
        
        if (allDead) {
            level++;
            alienSpeed = alienSpeed > 5 ? alienSpeed - 2 : 5;
            createAliens();
        }

        // Decrement flash counters
        if (playerHitFlash > 0) {
            playerHitFlash--;
        }
        for (var i = 0; i < aliens.size(); i++) {
            if (aliens[i]["flash"] > 0) {
                aliens[i]["flash"]--;
            }
        }
        
        // Decrement fire cooldown
        if (fireCooldown > 0) {
            fireCooldown--;
        }

        WatchUi.requestUpdate();
    }

    function onUpdate(dc) {
        var deviceSettings = System.getDeviceSettings();
        var screenHeight = deviceSettings.screenHeight;
        var screenWidth = deviceSettings.screenWidth;
        
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);

        // Draw game info lower to avoid bezel overlap - moved to y=35
        dc.drawText(screenWidth / 2, 35, Graphics.FONT_TINY, "Score: " + score + "  Lvl: " + level + "  Lives: " + lives, Graphics.TEXT_JUSTIFY_CENTER);

        // Draw player cannon (arcade style) with flash effect
        if (playerHitFlash > 0 && playerHitFlash % 2 == 0) {
            dc.setColor(Graphics.COLOR_RED, Graphics.COLOR_BLACK);
        }
        dc.fillRectangle(playerX - 10, screenHeight - 25, 20, 5);  // Base
        dc.fillRectangle(playerX - 7, screenHeight - 30, 14, 5);   // Middle
        dc.fillRectangle(playerX - 2, screenHeight - 35, 4, 5);    // Barrel
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);

        for (var i = 0; i < bullets.size(); i++) {
            var b = bullets[i];
            dc.fillRectangle(b["x"] - 1, b["y"], 2, 6);
        }

        // Draw alien bullets
        dc.setColor(Graphics.COLOR_GREEN, Graphics.COLOR_BLACK);
        for (var i = 0; i < alienBullets.size(); i++) {
            var ab = alienBullets[i];
            dc.fillRectangle(ab["x"] - 1, ab["y"], 2, 6);
        }

        // Draw aliens with flash effect
        for (var i = 0; i < aliens.size(); i++) {
            var a = aliens[i];
            if (a["alive"]) {
                dc.fillRectangle(a["x"] - 6, a["y"] - 6, 12, 12);
            } else if (a["flash"] > 0) {
                // Flash dead alien green/black
                if (a["flash"] % 2 == 0) {
                    dc.fillRectangle(a["x"] - 6, a["y"] - 6, 12, 12);
                }
            }
        }
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);

        if (gameOver) {
            dc.drawText(screenWidth / 2, screenHeight / 2, Graphics.FONT_MEDIUM, "GAME OVER", Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
            dc.drawText(screenWidth / 2, screenHeight / 2 + 30, Graphics.FONT_TINY, "Press SELECT", Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
        }
    }

    function moveLeft() {
        var deviceSettings = System.getDeviceSettings();
        if (playerX > 20) {
            playerX -= 10;
        }
    }

    function moveRight() {
        var deviceSettings = System.getDeviceSettings();
        if (playerX < deviceSettings.screenWidth - 20) {
            playerX += 10;
        }
    }

    function fire() {
        if (!gameOver && bullets.size() < 4 && fireCooldown == 0) {
            var deviceSettings = System.getDeviceSettings();
            bullets.add({ "x" => playerX, "y" => deviceSettings.screenHeight - 35 });
            fireCooldown = 3;  // Wait 3 frames (0.6 seconds at 5 FPS) before next shot
        } else if (gameOver) {
            resetGame();
        }
    }
}