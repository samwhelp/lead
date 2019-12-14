######  BUILD  ######

#INCLUDES = -Isrc -I/usr/include -I/usr/include/qt -I/usr/include/qt/QtWidgets -I/usr/include/qt/QtGui -I/usr/include/qt/QtCore
INCLUDES = -Isrc `pkg-config --cflags Qt5Widgets`

COMPILER = clang -std=c++11 -Wall -O3 -fPIC -MMD $(INCLUDES) -c $< -o $@
MOC = moc $(INCLUDES) -o $@ $<

#LINKER = g++ -o $@ $^ -lQt5Xdg -lQt5Widgets -lQt5Gui -lQt5Core
LINKER = g++ -o $@ $^ `pkg-config --libs Qt5Widgets`

MKDIR = mkdir -p $(dir $@)


# this prevents make from deleting the generated moc_*.cpp files
# so that the including of the dep-files will not fail
.SECONDARY:


data/usr/bin/lead: build/main.o build/app.o build/sensor.o build/screenname.o build/moc_app.o build/moc_sensor.o build/moc_screenname.o
	$(MKDIR)
	$(LINKER)

build/%.o: src/%.cpp
	$(MKDIR)
	$(COMPILER)

build/moc_%.o: build/moc_%.cpp
	$(MKDIR)
	$(COMPILER)

build/moc_%.cpp: src/%.h
	$(MKDIR)
	$(MOC)

-include build/*.d


######  CLEAN  ######

clean:
#	rm -f build/*
#	rm -f data/usr/bin/lead
	rm -rf build
	rm -rf data
.PHONY: clean

######  INSTALL  ######

install: data/usr/bin/lead
#	cp -r data/* /
	install -m 755 data/usr/bin/lead /usr/bin/lead
.PHONY: install

######  UNINSTALL  ######

uninstall:
	rm -f /usr/bin/lead
.PHONY: uninstall
