# Metavision HAL Viewer Sample

This code sample demonstrates how to use Metavision HAL to visualize events.

## Installation

First, make a copy of the code sample, so that you can work with this copy.
Go to the directory with your copy of the code sample and compile it.

```
mkdir build
cd build
cmake ..
cmake --build .
```

In this code sample, our CMakeLists.txt is configured in a such way that the executable is generated in the "build" directory.

## Running

Go to the "build" directory.

To start the viewer with a camera :

```
./metavision_hal_viewer
```

To start the viewer with a file :

```
./metavision_hal_viewer --from-raw YOUR_RAW.raw
```