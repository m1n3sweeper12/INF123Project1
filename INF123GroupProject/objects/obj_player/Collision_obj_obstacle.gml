invincible--;

// Only take damage if not currently invincible
if (invincible <= 0) {
    health -= 10;
    invincible = 30; // about half a second at 60fps
}


