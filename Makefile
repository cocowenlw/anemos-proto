.PHONY: generate lint clean

# Generate all protobuf stubs locally
generate:
	buf generate proto
	cd gen/go && go mod tidy

# Lint proto files
lint:
	buf lint proto

# Check for breaking changes against main branch
breaking:
	buf breaking proto --against '.git#branch=main'

# Remove all generated files
clean:
	rm -rf gen/go/common gen/go/wind gen/go/flight gen/go/platform gen/go/data_asset
