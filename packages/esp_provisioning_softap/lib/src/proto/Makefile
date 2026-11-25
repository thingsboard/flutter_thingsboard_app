all: c_proto python_proto

c_proto: *.proto
	@protoc-c --c_out=./proto-c/ -I . *.proto

python_proto: *.proto
	@protoc --python_out=./python/ -I . *.proto

dart_proto: *.proto
	@protoc --dart_out=./dart/ -I . *.proto
