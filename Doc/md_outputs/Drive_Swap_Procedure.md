Drive Swap Procedure

Acer Aspire TC-885 ↔ Lenovo Legion 5 (15AHP10)

Overview

This procedure swaps the storage drives between two computers without
losing any data:

- Acer TC-885: 2TB Samsung 990 PRO → 512GB drive (375GB used)

- Legion 5: 512GB drive → 2TB Samsung 990 PRO

Equipment Needed

- USB flash drive (1GB+ for Macrium Rescue Media)

- Macrium Reflect (or similar cloning software)

- External hard drive with 500GB+ free space (for both backup images)

- Screwdrivers for opening both computers

⚠ CRITICAL: Follow steps in exact order. Do NOT skip the backup step.
Cloning will overwrite data on target drives.

Step-by-Step Procedure

Phase 0: Create Rescue Media (Do This First)

**This step is critical.** The Rescue USB provides a neutral boot
environment that prevents boot conflicts, EFI partition issues, and BCD
corruption.

1.  On either machine, open Macrium Reflect.

2.  Select \'Other Tasks\' → \'Create Rescue Media\'.

3.  Choose USB flash drive as the target (at least 1GB recommended).

4.  Complete the creation process.

5.  Test that both machines can boot from this USB:

> • Restart each machine
>
> • Enter BIOS/UEFI (usually F2, F12, Del, or Esc during boot)
>
> • Select the USB drive from boot menu
>
> • Verify you see the Macrium Rescue environment (WinPE)

6.  Once confirmed, shut down both machines.

Phase 1: Create Backup Images of Both Machines

Each machine boots from its own OS to create its own image. No
cross-booting.

Part A: Image the Legion 5

7.  Boot the Legion 5 normally from its 512GB drive.

8.  Connect external hard drive with 300GB+ free space.

9.  Open Macrium Reflect and create disk image:

> • Select the 512GB internal drive
>
> • Choose \'Image this disk\'
>
> • Destination: External hard drive
>
> • File name: Legion_512GB_Image.mrimg

10. Wait for image creation to complete (15-30 minutes).

11. Verify image file exists on external drive.

12. Shut down Legion 5.

Part B: Image the Acer TC-885

13. Boot the Acer TC-885 normally from its 2TB drive.

14. Connect the same external hard drive.

15. Open Macrium Reflect and create disk image:

> • Select the 2TB Samsung 990 PRO
>
> • Choose \'Image this disk\'
>
> • Destination: External hard drive
>
> • File name: Acer_2TB_Image.mrimg

16. Wait for image creation to complete (20-45 minutes for 375GB of
    data).

17. Verify image file exists on external drive.

18. Shut down Acer TC-885.

**You now have both images on external drive. Both machines are shut
down.**

Phase 2: Restore Acer Image to 512GB Drive

⚠ CRITICAL: Boot from Rescue USB, NOT from any installed drive. This
prevents boot conflicts.

Hardware Setup

19. Remove 2TB drive from Acer TC-885.

20. Remove 512GB drive from Legion 5.

21. Install the 512GB drive into the Acer TC-885 internally.

22. Connect external hard drive (contains Acer_2TB_Image.mrimg) to Acer.

23. Insert Macrium Rescue USB into Acer.

Boot and Restore

24. **Power on Acer.**

25. Immediately enter BIOS/boot menu and select the USB drive to boot
    from.

26. **You should now be in the Macrium Rescue environment (WinPE).**

27. In Macrium Reflect (Rescue), select \'Restore\' tab.

28. Browse to Acer_2TB_Image.mrimg on external drive.

29. Select destination: Internal 512GB drive.

30. Macrium will automatically shrink partitions to fit 512GB (375GB
    used fits comfortably).

31. Click \'Finish\' and confirm to start restore.

32. Wait for restore to complete (30-60 minutes).

33. Remove Rescue USB when complete.

34. Reboot Acer normally.

**Acer now boots from 512GB with its original OS and data. No
cross-booting occurred.**

Phase 3: Restore Legion Image to 2TB Drive

⚠ CRITICAL: Again, boot from Rescue USB, NOT from any installed drive.

Hardware Setup

35. Install the 2TB drive into Legion 5 internally.

36. Connect external hard drive (contains Legion_512GB_Image.mrimg) to
    Legion.

37. Insert Macrium Rescue USB into Legion.

Boot and Restore

38. **Power on Legion 5.**

39. Enter BIOS/boot menu and select USB drive.

40. **Boot into Macrium Rescue environment (WinPE).**

41. In Macrium Reflect (Rescue), select \'Restore\' tab.

42. Browse to Legion_512GB_Image.mrimg on external drive.

43. Select destination: Internal 2TB drive.

44. Ensure \'Expand partition to fill disk\' is checked (to use full
    2TB).

45. Click \'Finish\' and confirm to start restore.

46. Wait for restore to complete (20-45 minutes).

47. Remove Rescue USB when complete.

48. Reboot Legion normally.

**Legion now boots its original OS from 2TB. No cross-booting
occurred.**

Final Verification

- Acer TC-885: Boot from 512GB drive, verify all 375GB of data is intact

- Legion 5: Boot from 2TB drive, verify all programs and files work

- Legion 5: Check Disk Management to confirm the 2TB partition expanded
  to full capacity

- Keep the Legion 5 backup image on the external drive for at least 30
  days

Why This Method Is Critical

- **Rescue Media prevents cross-booting:** You never boot one machine\'s
  OS on the other machine\'s hardware.

- **Avoids boot record conflicts:** Restoring while booted from the same
  disk causes UEFI, EFI partition, and BCD corruption issues.

- **No logical paradoxes:** You cannot restore to a disk that the OS is
  currently running from. Rescue Media provides a neutral environment.

- **Clean final state:** Acer boots its own OS from 512GB. Legion boots
  its own OS from 2TB. Zero cross-hardware activation triggers.

- **Time estimate:** Total procedure: 2 to 4 hours including imaging and
  restores.

Troubleshooting

**Problem: Cannot boot from Rescue USB**

> Solution: Enter BIOS/UEFI settings and ensure USB boot is enabled. Try
> different USB ports (USB 2.0 ports sometimes work better than USB 3.0
> for boot media). Verify Secure Boot is disabled if needed.

**Problem: Restore fails with \'not enough space\' error**

> Solution: The Acer\'s 375GB will fit on 512GB (476GB usable). If
> restore still fails, the image may contain hidden partitions. In
> Macrium, manually select only the main system partition to restore,
> excluding recovery partitions if space is tight.

**Problem: Computer won\'t boot after restore**

> Solution: Enter BIOS and ensure boot order is correct. The restored
> drive should be first in boot priority. If UEFI boot fails, try
> enabling \'Legacy Boot\' or \'CSM\' mode. Boot from Rescue USB again
> and use the \'Fix Windows Boot Problems\' option in Macrium.

**Problem: Macrium doesn\'t see the external drive in Rescue
environment**

> Solution: Some external drives need power-up time. Unplug and replug
> the external drive, wait 10 seconds, then click \'Refresh\' in
> Macrium. If still not visible, the USB controller may not be
> loaded---recreate Rescue Media with additional drivers included.

**Problem: Partition didn\'t expand to full 2TB on Legion**

> Solution: Boot Legion normally into Windows. Open Disk Management
> (diskmgmt.msc), right-click the main partition, and select \'Extend
> Volume\' to use remaining unallocated space.

Document created: February 2026
