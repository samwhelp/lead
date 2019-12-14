
# Fork Change


## Develop Environment

* Ubuntu 18.04


## Build Essential

``` sh
$ sudo apt-get install build-essential qt5-default clang
```

* [build-essential](https://packages.ubuntu.com/bionic/build-essential)
* [qt5-default](https://packages.ubuntu.com/bionic/qt5-default)
* [clang](https://packages.ubuntu.com/bionic/clang)


## Fork Change - Change Makefile

### 1

From

```
INCLUDES = -Isrc -I/usr/include -I/usr/include/qt -I/usr/include/qt/QtWidgets -I/usr/include/qt/QtGui -I/usr/include/qt/QtCore
```

To

```
INCLUDES = -Isrc `pkg-config --cflags Qt5Widgets`
```

### 2

From

```
LINKER = g++ -o $@ $^ -lQt5Xdg -lQt5Widgets -lQt5Gui -lQt5Core
```

To

```
LINKER = g++ -o $@ $^ `pkg-config --libs Qt5Widgets`
```

## Build

``` sh
$ make
```

* data/usr/bin/lead

exec

``` sh
$ tree build/
```

show

```
build/
├── app.d
├── app.o
├── main.d
├── main.o
├── moc_app.cpp
├── moc_app.d
├── moc_app.o
├── moc_screenname.cpp
├── moc_screenname.d
├── moc_screenname.o
├── moc_sensor.cpp
├── moc_sensor.d
├── moc_sensor.o
├── screenname.d
├── screenname.o
├── sensor.d
└── sensor.o

0 directories, 17 files
```

## Install

``` sh
$ sudo make install
```


## Uninstall

``` sh
$ sudo make uninstall
```

## Usage Example

* [example/rofi](example/rofi)
