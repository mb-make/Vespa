
all: vespa

vespa: vespa.gcode

.PHONY: vespa_repaired.stl
vespa_repaired.stl:
	wget -c https://cdn.thingiverse.com/assets/5e/ba/e4/7c/85/vespa_repaired.stl

projection.stl: projection.scad vespa_repaired.stl
	openscad $< --render -o $@

vespa.gcode: projection.stl
	slic3r $^

clean:
	rm -f vespa_repaired.stl projection.stl vespa.gcode
