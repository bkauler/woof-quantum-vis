# woof-quantum-vis
Woof build system for QV

![QV logo](qv96-green.png)

QV is a new very experimental Linux distribution, under development and still evolving. To read about what has happened so far, follow the blog posts with the "quirky" tag:

[BarryK News](https://bkhome.org/news/tag_quirky.html)

In a nutshell, QV has many features of EasyOS, except does not have a layered filesystem, nor SFS files. It is a "frugal full" installation, built from Void Linux packages using the XBPS package manager. It also has some EasyOS Kirkstone .tar.xz and PET packages. Another very significant feature is that QV is installed in a btrfs filesystem, with support for compression and snapshots.

The letters "QV" may mean "Quirky Void", as this is a very quirky distribution compared with Void Linux. Or, it may mean "Quantum Vis", which is Latin for "has everything that you need".

A developer may download this github project and run the scripts in the rootfs folder, in numerical sequence. Any Linux distribution can be setup to host this, or run a release of QV.

Releases will be announced on BarryK's News page. 

You can write the QV release drive-image file to a USB Flash drive and boot that. Or, it can be installed directly to an internal HDD or SSD with the qv-installer utility; with some caveats.
