categories = work service skills projects academics blog strengths languages pastimes resume
pages_dir = pages
partials_dir = partials
skeleton_files = skeleton/head.html skeleton/tail.html
misc =  object_extraction cv index

all: $(categories) $(misc)

# % cycles through a list of TARGETS one by one
# $< is the automatic variable that holds the name of the prerequisite
# $@ is the automatic variable that holds the name of the target
$(categories): %: $(partials_dir)/%/home.html $(skeleton_files)
	mkdir --parents $(pages_dir)/$@
	cat skeleton/head.html $< skeleton/tail.html > $(pages_dir)/$@/home.html

object_extraction: $(partials_dir)/projects/object_extraction.html $(skeleton_files)
	cat skeleton/head.html $< skeleton/tail.html > $(pages_dir)/projects/$@.html

cv: $(partials_dir)/resume/cv.html
	cp $< $(pages_dir)/resume/$@.html

index: $(partials_dir)/index.html $(skeleton_files)
	cat skeleton/head.html $< skeleton/tail.html > $(pages_dir)/$@.html
	cp pages/index.html index.html

base-gitlabio:
	sed --in-place --expression='s_http://www.ksinkar.in_https://ksinkar.gitlab.io_' skeleton/head.html

clean:
	rm -rf pages skeleton/skeleton.html
