invincible--;

// Only take damage if not currently invincible
if (invincible <= 0) {
    health -= 100/3;
    invincible = 30; // about half a second at 60fps
}


