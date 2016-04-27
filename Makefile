.PHONY: tarball

PLUGIN_NAME := vim-catch
INSTALL_BUNDLE_PATH := $(HOME)/.vim/bundle
INSTALL_PATH := $(INSTALL_BUNDLE_PATH)/$(PLUGIN_NAME)

tarball: $(PLUGIN_NAME).tar.gz

$(PLUGIN_NAME).tar.gz:
	tar zcvf $@ autoload/ doc/ ftplugin/ ftdetect/ syntax/

.PHONY: uninstall
uninstall: 
	rm -rf $(INSTALL_PATH)

.PHONY: install
install:
	rsync --exclude '*.sw?' -av autoload doc ftdetect ftplugin syntax $(INSTALL_PATH)
