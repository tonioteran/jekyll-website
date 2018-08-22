---
layout: page
title: Tips and Tricks
---

The intention of this space is to create an easily accessible compendium of useful tips and tricks that I've found throughout the ages while surfing the wonders of the WWW. 

## Command Line Tools


### adding characters to text files
Credit: [Tim Zimmermann](https://stackoverflow.com/questions/26476420/make-one-space-after-every-comma)

Specially when I deal with csv files, some tools (e.g., gnuplot) sometimes have trouble parsing or reading the file. One can quickly solve this issue by adding a whitespace after every comma character using `sed`, e.g.:

```bash
sed -i 's/,/, /g; s/,\s\+/, /g' file
```


### Removing Lines From Text Files
Credit: [SiegeX](https://stackoverflow.com/questions/5410757/delete-lines-in-a-text-file-that-contain-a-specific-string)

For deleting text lines containing a particular string, I use `sed`, e.g.:

```bash
sed -i '/pattern/d' ./nameOfFile
```

### Reformatting Images



### Resizing Images
Credit: [Rinzwind](https://askubuntu.com/questions/271776/how-to-resize-an-image-through-the-terminal)

To quickly resize an image using ```convert```, it's as simple as:

```bash
convert figure.png -resize 128x128 resizedFigure.png
``` 

### Convert Image Set Into Video
Credit: [Hammad Mazhar](http://hamelot.io/visualization/using-ffmpeg-to-convert-a-set-of-images-into-a-video/)

The previous list contains a pretty comprehensive list for accomplishing this by using `ffmpeg`.

My favorite usage goes something like this:

```bash
ffmpeg -framerate 6 -pattern_type glob -i 'LeftRightUnrectified*.bmp' -vb 20M -vcodec mpeg4 out.mp4
```

### Convert Image Set Into GIF

I've tried multiple tools, such as `ffmpeg`, `convert`, etc, and the way in which I find it the easiest to customize the delay is using `gm`:

```bash
gm convert -delay 10 -loop 0 OpticsMount_0_Images/LeftRightUnrectified*.bmp out.gif
```

For further optimization, I use `convert` with a varying level of fuzz in the following way:

```bash
convert LeftRightUnrectifiedGif.gif -fuzz 5% -layers Optimize result.gif
```

### Convert Video Into GIF
Credit: [LordNeckbeard](https://superuser.com/questions/556029/how-do-i-convert-a-video-to-gif-using-ffmpeg-with-reasonable-quality)

Created a wrapper for using `ffmpeg` to create frames from a video, and then using `convert` to transform them into a GIF. The script is `vid2gif.sh`.

```bash
./vid2gif.sh TS99_15_T7-BothStatGM_OVHD.ts 480 0.5 0.2 5%
```


### PDF Compression (macOS & Linux)
Credit: [Max Glenister](https://blog.omgmog.net/post/compressing-pdf-from-your-mac-or-linux-terminal-with-ghostscript/)

Using `ghostscript`, one can compress PDF files through the use of the following command:

```bash
gs -sDEVICE=pdfwrite -dNOPAUSE -dQUIET -dBATCH -dPDFSETTINGS=/screen -dCompatibilityLevel=1.4 -sOutputFile=output.pdf input.pdf
```

### Managing installed libraries
Credit: [crenate](https://stackoverflow.com/questions/8804064/find-opencv-version-installed-on-ubuntu)

Using pkg-config to procure information on installed libraries, e.g., finding out one's OpenCV version:

```bash
pkg-config --modversion opencv
```

### Connecting to VPN using Command Line
Credit: [A-B-B](https://superuser.com/questions/649614/connect-using-anyconnect-from-command-line)

When using Ubuntu 18, there seems to be an error while launching the Cisco Anyconnect application, so I opted to connect to the host using the command line:

```bash
/opt/cisco/anyconnect/bin/vpn -s connect HOST
```

One will then get prompted for username, password, and second password if duo authentication is required.


## Git Tools

### Update branches
Credit: [John Szakmeister](https://stackoverflow.com/questions/20106712/what-are-the-differences-between-git-remote-prune-git-prune-git-fetch-prune)

Allows one ot update one's local list of remote branches, which I always tend to forget how to do:

```bash
git remote update origin --prune
```


## IPython

### Apply changes after edits
Credit: [Andrew](https://stackoverflow.com/questions/1254370/reimport-a-module-in-python-while-interactive)

I was always very annoyed whenever changes to my files wouldn't be recognized during an ipython session (so much time spent debugging thinking there was an error in my code, when the only issue was that the changes weren't being taken into account). Using the [autoreload](https://ipython.readthedocs.io/en/stable/config/extensions/autoreload.html) extension, one is able to have the modules automatically reloaded before executing user code.

```python
%load_ext autoreload
%autoreload 2
```



## Gnuplot

### Reading parameters from external file
Credit: [stackoverflow](https://stackoverflow.com/questions/11211339/gnuplot-store-one-number-from-data-file-into-variable)

TODO: ... Explain and post example.


## C++ Tricks

### Creating directory during runtime

This [page](https://codeyarns.com/2014/08/07/how-to-create-directory-using-c-on-linux/) is an excellent references, with its example reproduced here:

```cpp
#include <sys/stat.h>

const int dir_err = mkdir("foo", S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH);
if (-1 == dir_err) {
    printf("Error creating directory!n");
    exit(1);
}
```

### creating threads within classes

Credit: [Adam Rosenfield](https://stackoverflow.com/users/9530/adam-rosenfield)

This [stackoverflow post](https://stackoverflow.com/questions/1151582/pthread-function-from-a-class) has some pretty nifty advices:

