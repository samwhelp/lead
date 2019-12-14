
## config dir path
### ./config
SOURCE_CONFIG_DIR_PATH=./config

### ~/.config
TARGET_CONFIG_DIR_PATH=$(HOME)/.config

### ~/.config/autostart
TARGET_AUTOSTART_DIR_PATH=$(TARGET_CONFIG_DIR_PATH)/autostart


## rofi
### ./config/rofi/config
ROFI_SOURCE_CONFIG_FILE_PATH=$(SOURCE_CONFIG_DIR_PATH)/rofi/config

### ~/.config/rofi
ROFI_TARGET_CONFIG_DIR_PATH=$(TARGET_CONFIG_DIR_PATH)/rofi
### ~/.config/rofi/config
ROFI_TARGET_CONFIG_FILE_PATH=$(ROFI_TARGET_CONFIG_DIR_PATH)/config


## lead
### ./config/lead/lead.conf
LEAD_SOURCE_CONFIG_FILE_PATH=$(SOURCE_CONFIG_DIR_PATH)/lead/lead.conf

### ~/.config/lead
LEAD_TARGET_CONFIG_DIR_PATH=$(TARGET_CONFIG_DIR_PATH)/lead
### ~/.config/lead/lead.conf
LEAD_TARGET_CONFIG_FILE_PATH=$(LEAD_TARGET_CONFIG_DIR_PATH)/lead.conf


## lxqt
### ./config/autostart/lxqt-lead.desktop
LEAD_SOURCE_AUTOSTART_FILE_PATH=$(SOURCE_CONFIG_DIR_PATH)/autostart/lxqt-lead.desktop

### ~/.config/autostart/config
LEAD_TARGET_AUTOSTART_FILE_PATH=$(TARGET_AUTOSTART_DIR_PATH)/lxqt-lead.desktop



default: help
.PHONY: default


help:
	@echo Usage:
	@echo
	@echo $$ make [target]
	@echo
	@echo
	@echo Example:
	@echo
	@echo $$ make
	@echo $$ make help
	@echo
	@echo $$ make prepare
	@echo
	@echo $$ make install
	@echo $$ make remove
	@echo
	@echo $$ make start
	@echo $$ make stop

.PHONY: help


prepare: rofi-package-install
.PHONY: prepare


install: rofi-config-install lead-config-install lead-autostart-install
.PHONY: install


remove: rofi-config-remove lead-config-remove lead-autostart-remove
.PHONY: remove


start: lead-start
.PHONY: start


stop: lead-stop
.PHONY: stop


rofi-config-install: rofi-config-dir
	install -m 644 $(ROFI_SOURCE_CONFIG_FILE_PATH) $(ROFI_TARGET_CONFIG_FILE_PATH)
.PHONY: rofi-config-install


rofi-config-remove:
	rm -f $(ROFI_TARGET_CONFIG_FILE_PATH)
.PHONY: rofi-config-remove


rofi-config-dir:
	mkdir -p $(ROFI_TARGET_CONFIG_DIR_PATH)
.PHONY: rofi-config-dir


rofi-package-install:
	sudo apt-get install rofi
.PHONY: rofi-package-install




lead-config-install: lead-config-dir
	install -m 644 $(LEAD_SOURCE_CONFIG_FILE_PATH) $(LEAD_TARGET_CONFIG_FILE_PATH)
.PHONY: lead-config-install


lead-config-remove:
	rm -f $(LEAD_TARGET_CONFIG_FILE_PATH)
.PHONY: lead-config-remove


lead-config-dir:
	mkdir -p $(LEAD_TARGET_CONFIG_DIR_PATH)
.PHONY: lead-config-dir


lead-start:
	lead &
.PHONY: lead-run


lead-stop:
	killall -9 lead
.PHONY: lead-run




lead-autostart-install: lead-autostart-dir
	install -m 644 $(LEAD_SOURCE_AUTOSTART_FILE_PATH) $(LEAD_TARGET_AUTOSTART_FILE_PATH)
.PHONY: lead-autostart-install


lead-autostart-remove:
	rm -f $(LEAD_TARGET_AUTOSTART_FILE_PATH)
.PHONY: lead-autostart-remove


lead-autostart-dir:
	mkdir -p $(TARGET_AUTOSTART_DIR_PATH)
.PHONY: lead-autostart-dir
