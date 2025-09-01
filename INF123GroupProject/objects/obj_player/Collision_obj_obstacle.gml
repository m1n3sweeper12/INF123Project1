// Reduce player health
health -= 1;
// Only take damage if not currently invincible
if (invincible <= 0) {
    health -= 1;
    invincible = 30; // about half a second at 60fps

}