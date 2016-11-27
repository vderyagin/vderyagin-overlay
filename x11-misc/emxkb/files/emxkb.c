/* Thanks to Evgeny Chukreev (C) 2005, GNU GPL */
/* See http://akshaal.livejournal.com/58473.html */

/* Modified a little by Bzek .) */
/* Modified a little more by Victor Deryagin (dropped emacs-related things) */

/* Compilation: gcc -L/usr/X11R6/lib -lX11 -o emxkb emxkb.c */

/* Usage:
 *      emxkb 0  # For first group
 *      emxkb 1  # For second group
 *      emxkb 2  # For third group
 */

#include <X11/Xlib.h>
#include <X11/XKBlib.h>
#include <X11/keysym.h>
#include <X11/Xutil.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* For locking a group */
int lock_group (int window_id, int group);

/* Main function */
int
main (int argc, char *argv[]) {

    Display *display;
    Window focus;
    int revert, group;

    /* Check arguments */
    if (argc < 2) {
        fprintf (stderr, "Usage: %s <group>\n", argv[0]);
        return -1;
    }

    /* Parse arguments */
    group = strtol (argv[1], NULL, 0);

    /* Open display */
    display = XOpenDisplay (NULL);

    if (!display) {
        fprintf (stderr, "%s: Can't open display\n", argv[0]);
        return -2;
    }

    /* Get window id */
    if (!XGetInputFocus (display, &focus, &revert)) {
        fprintf (stderr, "%s: Can't get focus\n", argv[0]);
        return -3;
    }

    if (!lock_group (focus, group)) {
      fprintf (stderr, "%s: Failed during locking group\n", argv[0]);
      return -5;
    }

    /* Close display */
    XCloseDisplay (display);

    /* That is all */
    return 0;
}

int
lock_group (int window_id, int group) {

    Display *xkb_display;
    int res;

    /* Open xkb display */
    xkb_display = XkbOpenDisplay (NULL, NULL, NULL, NULL, NULL, NULL);

    if (!xkb_display) {
        fprintf (stderr, "lock_group(): Can't open display\n");
        return -1;
    }

    /* Init XKB */
    res = XkbQueryExtension (xkb_display, NULL, NULL, NULL, NULL, NULL);
    if (!res) {
        fprintf (stderr, "lock_group(): Can't init XKB\n");
        return -2;
    }

    /* Set Focus */
    if (window_id > 0) {
        XSetInputFocus (xkb_display, window_id, RevertToParent, CurrentTime);
        XSync (xkb_display, False);
    }

    /* Lock Group */
    res = XkbLockGroup (xkb_display, XkbUseCoreKbd, abs (group % 4));
    if (!res) {
        fprintf (stderr, "lock_group(): Can't lock group\n");
        return -3;
    }

    XSync (xkb_display, False);

    /* Close xkb display */
    XCloseDisplay (xkb_display);

    return 1;
}
