# Makefile for compiling Quarto documents using litedown::fuse() or quarto render

# Variable to control build method (litedown or quarto)
BUILD_METHOD ?=quarto

# Find all .qmd files in the current directory
QMD_FILES := $(wildcard *.qmd)
#QMD_FILES :=simple.qmd

# Generate lists of target HTML and Markdown files
HTML_FILES := $(QMD_FILES:.qmd=.html)
MD_FILES := $(QMD_FILES:.qmd=.md)

# Generate a list of potential *_files directories
LITEDOWN_FILES_DIRS := $(addsuffix __files,$(basename $(QMD_FILES)))
QUARTO_FILES_DIRS := $(addsuffix _files,$(basename $(QMD_FILES)))

# Default target: build all HTML files
all: $(HTML_FILES) 

# Target to build all html files
html: $(HTML_FILES)

# Rule to build HTML from QMD (depending on BUILD_METHOD)
%.html: %.qmd
ifeq ($(BUILD_METHOD),litedown)
	@echo "litedown::fuse building '$*.md'"
	@Rscript fuse_qmd.R '$<' '$*.md'
	@echo "litedown::mark building '$@'"
	@Rscript mark_md.R '$*.md' '$@' 
else
	quarto render '$<'
endif

# New target to run set_latex.py on all .md files
sed_latex:
	@echo "Running set_latex.py on all .md files"
	@for file in $(MD_FILES); do \
		echo "Processing $$file"; \
		./sed_latex.py $$file; \
	done

# Clean up generated files and directories
clean:
	rm -f $(HTML_FILES) $(MD_FILES)
	rm -rf $(LITEDOWN_FILES_DIRS) $(QUARTO_FILES_DIRS)

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
.PHONY: all md html clean watch serve watch_and_serve set_latex
