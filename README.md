# DockerAOT

.NET Ahead-of-Time compilation compiler

**Supports:**
 .NET 8
 .NET 9

**Architecture**
  arm64

**Tested on:**
  Milk-V duos


#### Usage

Copy `build.sh` to your .NET project directory.  It can be in the project root, or
sub directory.

    wget https://raw.githubusercontent.com/dotTinyNet/DockerAOT/refs/heads/main/build.sh
    chmod +x build.sh

Edit the file, and change the SDK to match the .NET version.

Optionally copy `Dockerfile`. Without it, the pre-compiled version from GitHub
will be pulled.

Optionally copy and edit `copyTo.sh` to copy the executable to your device.
    
#### To Build

    ./build.sh [IP address]

#### copyTo.sh

If you want to automatically copy your build to a remote device, place a copyTo.sh script in the same directory.  This will be called, after build.sh completes.
Any arguments you give to build.sh, will be passed to copyTo.sh.  Use ours as a template.
