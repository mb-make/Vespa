
all: vespa

vespa: vespa_repaired.stl model.stl model.gcode

.PHONY: vespa_repaired.stl
vespa_repaired.stl:
	wget -c https://cdn.thingiverse.com/assets/5e/ba/e4/7c/85/vespa_repaired.stl

model.stl: model.scad vespa_repaired.stl
	openscad $< --render -o $@

model.gcode: model.stl
	slic3r $^

clean:
	rm -f vespa_repaired.stl model.stl model.gcode
