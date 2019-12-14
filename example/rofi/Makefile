
## config dir path
### ./config
SOURCE_CONFIG_DIR_PATH=./config

### ~/.config
TARGET_CONFIG_DIR_PATH=$(HOME)/.config


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
	@echo $$ make install
	@echo $$ make remove
	@echo
	@echo $$ make start
	@echo $$ make stop

.PHONY: help


install: rofi-config-install lead-config-install
.PHONY: install


remove: rofi-config-remove lead-config-remove
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
