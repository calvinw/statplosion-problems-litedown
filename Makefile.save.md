# Makefile for compiling Quarto documents using litedown::fuse()

# Find all .qmd files in the current directory
QMD_FILES := $(wildcard *.qmd)

# Generate lists of target HTML and Markdown files
HTML_FILES := $(QMD_FILES:.qmd=.html)
MD_FILES := $(QMD_FILES:.qmd=.md)

# Generate a list of potential *_files directories
FILES_DIRS := $(addsuffix __files,$(basename $(QMD_FILES)))

# Default target: build all HTML files
all: $(MD_FILES) $(HTML_FILES) 

# Target to build all Markdown files
md: $(MD_FILES)

# Target to build all html files
html: $(HTML_FILES)

# Rule to build HTML from QMD
%.html: %.md
	Rscript mark_md.R '$<' '$@'

# Rule to build Markdown from QMD
%.md: %.qmd
	Rscript fuse_qmd.R '$<' '$@'

# Clean up generated files and directories
clean:
	rm -f $(HTML_FILES) $(MD_FILES)
	rm -rf $(FILES_DIRS)

# Watch for changes and rebuild
watch:
	@echo "Watching for changes. Press Ctrl+C to stop."
	@while true; do \
		inotifywait -e modify *.qmd; \
		make; \
	done

# Start R live server
serve:
	Rscript -e "servr::httw(pattern = '*.html')"

watch_and_serve:
	@echo "Starting the R live server and watching for changes. Press Ctrl+C to stop."
	@Rscript -e "servr::httw(pattern = '*.html')" & \
	while true; do \
		inotifywait -e modify *.qmd; \
		echo "Change detected, running make..."; \
		make; \
	done

# Phony targets
.PHONY: all md clean watch serve watch_and_serve
