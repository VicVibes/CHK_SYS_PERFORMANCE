**BREAK-DOWN OF WHAT THE SCRIPT DO**

Checks RAM (Memory) Usage

It uses the free -m command to find out how much memory (RAM) is currently being used in megabytes.

If the memory usage is higher than a set limit (like 3200MB), it shows a warning message: “MEMORY USE TOO HIGH”.

Otherwise, it says the memory usage is okay.

Checks Disk Space

It uses the df -m command to check how much disk space is left in the system (specifically from a particular volume or mount point).

If the disk space is more than 10GB (10240MB), it says “ENOUGH DISK SPACE”.

If it’s between 2GB and 10GB, it warns: “Disk Space Running Low”.

If it’s below 2GB, it gives a serious warning: “DISK SPACE LOW: ADD STORAGE”.

Checks CPU Load

It uses the top command to get the current CPU load average (how busy the processor is).

It compares the CPU load to a limit (set at 2.00 for 2 CPU cores).

If the current CPU load is higher than the limit, it shows: “CPU USAGE HIGH”.

If it's below, it says: “CPU USAGE NORMAL”.

