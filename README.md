# dotTinyNet DockerAOT

dotTinyNet Ahead-of-Time compilation compiler

**Supports:**
 .NET 8
 .NET 9

**Architecture**
  arm64

**Tested on:**
  Milk-V duos


**Usage:**

Copy `build.sh` to your .NET project directory.  It can be in the project root, or
sub directory.

    wget https://raw.githubusercontent.com/dotTinyNet/DockerAOT/refs/heads/main/build.sh
    chmod +x build.sh

Optionally copy `Dockerfile`. Without it, the pre-compiled version from GitHub
will be pulled.

Optionally copy and edit `copyTo.sh` to copy the executable to your device.

    
    ./build.sh