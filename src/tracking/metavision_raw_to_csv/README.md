# Metavision RAW to CSV Sample

This code sample demonstrates how to use Metavision Core SDK pipeline utility to convert an event-based RAW file to a CSV formatted event-based file.
It also shows how to customize an instance of BaseStage to write to a file. This can be an alternative to creating a class deriving from BaseStage, especially when the code is not particularly reusable.

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

To start the sample with an input file :

```
./metavision_raw_to_csv <YOUR_FILE.raw>
```
