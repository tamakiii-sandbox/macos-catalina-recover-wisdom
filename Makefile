.PHONY: install info sh clean

XML := /System/Library/AssetsV2/com_apple_MobileAsset_DictionaryServices_dictionaryOSX/com_apple_MobileAsset_DictionaryServices_dictionaryOSX.xml
IMAGE := python:3.9.0a2-alpine3.10
TARGET := ~/Library/Dictionaries/Sanseido\ The\ WISDOM\ English-Japanese\ Japanese-English\ Dictionary.downloaded.dictionary
DOWNLOAD_URL ?= $(shell cat $(XML) | docker run --rm -i -v $(PWD):/app -w /app $(IMAGE) python src/main.py)

install: $(TARGET)
	open /System/Applications/Dictionary.app

info:
	echo $(DOWNLOAD_URL)
	echo $(TARGET)

$(TARGET):
	curl -SL "$(DOWNLOAD_URL)" -o - | tar -x -C ~/Library/Dictionaries "AssetData/Sanseido The WISDOM English-Japanese Japanese-English Dictionary.dictionary"

$(TARGET_DIR):
	mkdir -p $@

sh:
	docker run --rm -it -v $(PWD):/app -w /app $(IMAGE) ash

clean:

