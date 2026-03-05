**Jump Desktop --- Windows 11 Home Laptop Setup**

*24/7 Unattended Remote Access Configuration*

1\. Install Jump Desktop Connect

Jump Desktop Connect is the background agent that keeps your laptop
reachable at all times. Download it from **jumptoconsole.com/connect**
and sign in with your Jump Desktop account.

1.  Download and install Jump Desktop Connect.

2.  Sign in with your Jump Desktop account.

3.  In Connect\'s settings, enable \"Automatically start at login.\"

4.  Verify the machine appears in your Jump Desktop device list on
    another device.

> *Note: On Windows 11 Pro, Jump Desktop Connect runs as a system
> service and is reachable before login. On Windows 11 Home, test after
> a reboot to confirm --- it may behave the same way. If not, configure
> auto-login as described in Section 5.*

2\. Disable Sleep & Hibernate

If the laptop sleeps, it becomes unreachable. Set all power timeouts to
Never while on AC power.

5.  **Open:** Settings → System → Power & Sleep

6.  Set \"Screen\" to **Never** (when plugged in).

7.  Set \"Sleep\" to **Never** (when plugged in).

8.  Click **Additional power settings** → Change plan settings → Change
    advanced power settings → Sleep → Hibernate After → set to
    **Never**.

3\. Set Lid Close to Do Nothing

By default, closing the laptop lid puts it to sleep. Change this so the
machine stays on when the lid is closed.

9.  **Open:** Control Panel → Hardware and Sound → Power Options

10. Click \"Choose what closing the lid does\" in the left sidebar.

11. Set \"When I close the lid\" → Plugged in column → **Do nothing**.

12. Click **Save changes**.

4\. Disable Fast Startup

Fast Startup causes Windows to use a hybrid shutdown state rather than a
true reboot, which can prevent remote access after a shutdown. Disable
it.

13. **Open:** Control Panel → Hardware and Sound → Power Options

14. Click \"Choose what the power buttons do\" in the left sidebar.

15. Click \"Change settings that are currently unavailable.\"

16. Uncheck **\"Turn on fast startup (recommended)\"** and save changes.

5\. Configure Auto-Login (if needed)

If you find the machine is unreachable after a reboot until someone
types the password at the physical keyboard, enable auto-login so
Windows boots straight to the desktop.

17. Press **Win + R**, type **netplwiz**, and press Enter.

18. Uncheck \"Users must enter a username and password to use this
    computer.\"

19. Enter your password when prompted and click OK.

20. Reboot and verify the machine logs in automatically.

> *Warning: Auto-login reduces local physical security. Use it only if
> the laptop is in a physically secure location. Also note that Windows
> Update may re-enable the login requirement after major updates --- if
> you suddenly lose remote access after an update, re-check this
> setting.*

6\. Manage Windows Update Restarts

Windows can reboot automatically after updates, temporarily losing
connectivity. Configure active hours to limit when this can happen.

21. **Open:** Settings → Windows Update → Advanced Options → Active
    Hours

22. Set active hours to cover your typical working/usage window. Windows
    will avoid rebooting during these hours.

7\. Keep it on AC Power

For reliable 24/7 access the laptop must stay plugged in. Battery saver
mode can throttle or disable network activity.

- Keep the laptop permanently plugged into AC power.

- **Open:** Settings → System → Battery → Battery Saver → disable
  automatic battery saver.

- Ensure the power adapter is rated for continuous use.

Quick Reference Checklist

  -----------------------------------------------------------------------
       **Setting**                     **Where to set it**
  ---- ------------------------------- ----------------------------------
  ☐    Install Jump Desktop Connect +  jumptoconsole.com/connect
       enable auto-start               

  ☐    Screen timeout → Never (plugged Settings → System → Power & Sleep
       in)                             

  ☐    Sleep → Never (plugged in)      Settings → System → Power & Sleep

  ☐    Hibernate → Never               Control Panel → Power Options →
                                       Advanced

  ☐    Lid close → Do nothing (plugged Control Panel → Power Options →
       in)                             Lid close

  ☐    Fast Startup → Disabled         Control Panel → Power Options →
                                       Power buttons

  ☐    Auto-login (if needed)          Win+R → netplwiz

  ☐    Active Hours configured         Settings → Windows Update →
                                       Advanced

  ☐    Laptop on AC power permanently  Physical / power adapter
  -----------------------------------------------------------------------

*Once all items are checked, reboot the laptop and verify you can
connect via Jump Desktop from another device without anyone touching the
laptop.*
